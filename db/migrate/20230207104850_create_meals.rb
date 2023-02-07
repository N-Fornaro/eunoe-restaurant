class CreateMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :meals do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :dish

      t.timestamps
    end
  end
end
