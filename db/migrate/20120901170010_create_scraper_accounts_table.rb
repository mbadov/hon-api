class CreateScraperAccountsTable < ActiveRecord::Migration
  def up
    create_table :scraper_accounts do |t|
      t.text :username
      t.text :password
    end
  end

  def down
    drop_table :scraper_accounts
  end
end
