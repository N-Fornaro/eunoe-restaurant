class AddDateToPrivatisations < ActiveRecord::Migration[7.0]
  def change
    add_column :privatisations, :date, :date
  end
end
