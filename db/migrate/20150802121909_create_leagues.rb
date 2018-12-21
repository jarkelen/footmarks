class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :country
      t.string :name
      t.integer :step

      t.timestamps null: false
    end
    add_index :leagues, :step
    add_index :leagues, :country
  end
end
