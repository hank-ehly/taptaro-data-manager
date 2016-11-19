class AddPositionToCategoryItem < ActiveRecord::Migration
  def change
    add_column :category_items, :position, :integer
  end
end
