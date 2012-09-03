class AddConstraints < ActiveRecord::Migration
  def up
    execute "ALTER TABLE match_players ADD FOREIGN KEY (match_id) REFERENCES matches (id);"
    execute "ALTER TABLE match_players ADD CONSTRAINT match_id_account_id_check UNIQUE (match_id, account_id);"
  end

  def down
    execute "ALTER TABLE match_players DROP CONSTRAINT match_players_match_id_fkey;"
    execute "ALTER TABLE match_players DROP CONSTRAINT match_id_account_id_check;"
  end
end
