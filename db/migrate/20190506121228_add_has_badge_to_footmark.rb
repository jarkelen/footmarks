class AddHasBadgeToFootmark < ActiveRecord::Migration[5.2]
  def change
    add_column :footmarks, :has_badge, :boolean, default: false
  end
end
