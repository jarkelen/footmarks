class CreateFootmarks < ActiveRecord::Migration
  def change
    create_table :footmarks do |t|
      t.integer :nr, null: false
      t.date :visit_date, null: false
      t.string :ground, null: false
      t.string :street
      t.string :city
      t.string :country, null: false
      t.string :result, null: false
      t.string :season, null: false
      t.string :kickoff, null: false
      t.integer :gate, null: false
      t.decimal :ticket_price
      t.boolean :countfor92, null: false
      t.string :home_club, null: false
      t.string :away_club, null: false
      t.string :league, null: false
      t.string :programme_link
      t.string :ticket_link
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
    add_index :footmarks, :nr, unique: true
  end
end
