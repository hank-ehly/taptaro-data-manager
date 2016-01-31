class AddTokenToCategoryItems < ActiveRecord::Migration
  def change
    add_column :category_items, :token, :string
  end
end