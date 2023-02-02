class RenameTypeToMeal < ActiveRecord::Migration[7.0]
  def change
    rename_column :menus, :type, :meal
  end
end
