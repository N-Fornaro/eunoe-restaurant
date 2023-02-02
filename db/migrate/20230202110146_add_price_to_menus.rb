class AddPriceToMenus < ActiveRecord::Migration[7.0]
  def change
    add_column :menus, :price, :integer
  end
end
