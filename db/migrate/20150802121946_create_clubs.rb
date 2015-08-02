class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.integer :league_id
      t.string :name

      t.timestamps null: false
    end
    add_index :clubs, :league_id
  end
end
