class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :url
      t.string :footmark_id

      t.timestamps null: false
    end
    add_index :photos, :footmark_id
  end
end
