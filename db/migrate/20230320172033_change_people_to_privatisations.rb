class ChangePeopleToPrivatisations < ActiveRecord::Migration[7.0]
  def change
    remove_column :privatisations, :people
    add_column :privatisations, :people, :integer
  end
end
