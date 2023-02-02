class RemoveColumnsToMenus < ActiveRecord::Migration[7.0]
  def change
    remove_columns :menus, :title
    remove_columns :menus, :price
  end
end
