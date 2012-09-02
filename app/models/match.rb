class Match < ActiveRecord::Base
  has_many :match_players
  
  def self.scraper_remap
    {'match_id' => 'id', 'class' => 'mclass'}
  end
  
  def self.scraper_filter
    ['date', 'time']
  end
end