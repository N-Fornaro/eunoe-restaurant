class UpdateDateInPrivatisations < ActiveRecord::Migration[7.0]
  def change
    remove_column :privatisations, :date
  end
end
