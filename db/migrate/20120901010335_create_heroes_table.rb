class CreateHeroesTable < ActiveRecord::Migration
  def up
    create_table :heroes do |t|
    end
  end

  def down
    drop_table :heroes
  end
end
