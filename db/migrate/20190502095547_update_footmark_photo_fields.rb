class UpdateFootmarkPhotoFields < ActiveRecord::Migration[5.2]
  def change
    add_column :footmarks, :has_photos, :boolean, default: false
    add_column :footmarks, :has_programme, :boolean, default: false
    add_column :footmarks, :has_ticket, :boolean, default: false
    remove_column :footmarks, :programme_link
    remove_column :footmarks, :ticket_link
    drop_table :photos
  end
end
