class Player < ActiveRecord::Base
  has_many :match_players
end