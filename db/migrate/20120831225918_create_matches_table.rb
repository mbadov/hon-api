class CreateMatchesTable < ActiveRecord::Migration
  def up
    create_table :matches do |t|
      t.integer :server_id
      t.text :map
      t.text :map_version
      t.integer :time_played
      t.text :file_host
      t.integer :file_size
      t.text :file_name
      t.integer :c_state
      t.text :version
      t.datetime :mdt
      t.integer :avgpsr
      t.text :url
      t.integer :size
      t.text :name
      t.text :mname
      t.integer :mclass
      t.integer :private
      t.integer :nm
      t.integer :sd
      t.integer :rd
      t.integer :dm
      t.integer :bd
      t.integer :bp
      t.integer :cd
      t.integer :cm
      t.integer :league
      t.integer :max_players
      t.integer :tier
      t.integer :no_repick
      t.integer :no_agi
      t.integer :drp_itm
      t.integer :no_timer
      t.integer :rev_hs
      t.integer :no_swap
      t.integer :no_int
      t.integer :alt_pick
      t.integer :veto
      t.integer :shuf
      t.integer :no_str
      t.integer :no_pups
      t.integer :dup_h
      t.integer :ap
      t.integer :ar
      t.integer :em
      t.integer :cas
      t.integer :rs
      t.integer :nl
      t.integer :officl
      t.integer :no_stats
      t.integer :ab
      t.integer :hardcore
      t.integer :dev_heroes
      t.integer :verified_only
      t.integer :gated
      t.integer :winning_team
    end
  end

  def down
    drop_table :matches
  end
end
