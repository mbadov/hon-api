class CreatePlayersTable < ActiveRecord::Migration
  def up
    create_table :players do |t|
    end
  end

  def down
    drop_table :players
  end
end
