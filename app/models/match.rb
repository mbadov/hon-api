class Match < ActiveRecord::Base
  has_many :match_players
  
  def self.remap_params(match_summary)
    
  end
  
  def self.create_from_match_summary(match_summary)
    
  end
end