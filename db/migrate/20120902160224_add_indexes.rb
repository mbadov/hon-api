class AddIndexes < ActiveRecord::Migration
  def up
    add_index(:match_players, :match_id)
    add_index(:match_players, :account_id)
    add_index(:match_players, :hero_id)
  end

  def down
    remove_index(:match_players, :column => :match_id)
    remove_index(:match_players, :column => :account_id)
    remove_index(:match_players, :column => :hero_id)
  end
end
