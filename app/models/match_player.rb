class MatchPlayer < ActiveRecord::Base
  belongs_to :match
  belongs_to :player, :foreign_key => 'account_id'
  

  
  def filter_params(player_stats)
    bad_keys = ['cli_name']
    bad_keys.each do |bad_key|
      player_stats.delete bad_key
    end
  end
  
  def self.create_from_player_stats(player_stats)
    player_stats = convert_to_typed_values(player_stats)
    
    
  end
end