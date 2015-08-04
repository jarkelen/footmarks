class CreateFootmarks < ActiveRecord::Migration
  def change
    create_table :footmarks do |t|
      t.integer :nr
      t.date :visit_date
      t.string :ground
      t.string :street
      t.string :city
      t.integer :goals_home
      t.integer :goals_away
      t.string :season
      t.string :kickoff
      t.integer :gate
      t.decimal :ticket_price
      t.boolean :countfor92, null: false
      t.integer :club_id, null: false
      t.integer :away_club_id, null: false
      t.integer :league_id
      t.string :programme_link
      t.string :ticket_link
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
    add_index :footmarks, :nr, unique: true
    add_index :footmarks, :club_id
    add_index :footmarks, :league_id
    add_index :footmarks, :away_club_id
  end
end
