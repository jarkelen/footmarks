class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :url
      t.string :footmark_id

      t.timestamps null: false
    end
    add_index :photos, :footmark_id
  end
end
