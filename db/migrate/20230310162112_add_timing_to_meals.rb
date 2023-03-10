class AddTimingToMeals < ActiveRecord::Migration[7.0]
  def change
    add_column :meals, :timing, :string
  end
end
