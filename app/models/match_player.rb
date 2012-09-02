class MatchPlayer < ActiveRecord::Base
  belongs_to :match
  belongs_to :player, :foreign_key => 'account_id'
end