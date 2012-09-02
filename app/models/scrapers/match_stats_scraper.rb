require "net/http"
require "uri"

module Scrapers
  class MatchStatsScraper
    def initialize(scraper_account, login_on_init = true)
      @account = scraper_account.username
      @password = scraper_account.password
      @cookie = nil
      
      login if login_on_init
    end
    
    def login
      uri = URI.parse login_url(@account, @password)
      resp = Net::HTTP.get_response uri
      php = PHP.unserialize resp.body
      @cookie = php["cookie"]
    end
    
    def login_url(account, password)
      "http://masterserver.hon.s2games.com/client_requester.php?f=auth&login=#{account}&password=#{password}"
    end
    
    def match_url(match_id)
      "http://masterserver.hon.s2games.com/client_requester.php?f=get_match_stats&match_id[]=#{match_id}&cookie=#{@cookie}"
    end
    
    # The master server returns all data serialized in PHP form. Luckily, there
    # exists a library in ruby to unserialize PHP objects.
    def get_match_data(match_id)
      uri = URI.parse match_url(match_id)
      resp = Net::HTTP.get_response uri
      
      PHP.unserialize resp.body
    end
    
    # There are always two hash accesses required to access raw data, one of
    # which is the match_id itself. I suspect that the master server supports
    # grabbing data for multiple matches at once, but I haven't been able to
    # figure out the syntax for such a query. For now, grab one match at once.
    #
    # 1.9.3-p194 :026 > match_data['match_summ'].keys
    # => [91000000]
    def match_id_from_data(match_data)
      match_data['match_summ'].keys.first
    end
    
    def typed_value(raw_value, type)
      case type
      when :integer
        return raw_value.to_i
      when :float
        return raw_value.to_f
      when :text
        return raw_value.to_s
      when :datetime
        return DateTime.parse(raw_value)
      else
        return raw_value
      end
    end

    def typed_values(klass, values)
      typed_values = {}

      values.each do |stat_name, stat_value|
        puts stat_name unless klass.columns_hash[stat_name]
        type = klass.columns_hash[stat_name].type
        typed_values[stat_name] = typed_value(stat_value, type)
      end

      typed_values
    end
    
    def remap_value_names(map, values)
      map.each do |old_name, new_name|
        values[new_name] = values.delete old_name
      end
    end
    
    def filter_values(value_names, values)
      value_names.each do |value_name|
        values.delete value_name
      end
    end
    
    def save_match(match_id)
      match_data = get_match_data(match_id)
      save_match_summary(match_data)
      save_player_stats(match_data)
    end
    
    def save_match_summary(match_data)      
      match_id = match_id_from_data(match_data)
      match_summary = match_data['match_summ'][match_id]
      
      remap_value_names(Match.scraper_remap, match_summary)
      filter_values(Match.scraper_filter, match_summary)
      match_summary = typed_values(Match, match_summary)
      
      # The id must be set explicitly, or else Rails will use its own
      Match.create(match_summary) do |match|
        match.id = match_summary['id']
      end
    end
    
    def save_player_stats(match_data)
      match_id = match_id_from_data(match_data)
      match_players = match_data['match_player_stats'][match_id]
      
      match_players.each do |account_id, player_stats|
        player_stats = typed_values(MatchPlayer, player_stats)
        MatchPlayer.create(player_stats)
      end
    end
   
  end
end