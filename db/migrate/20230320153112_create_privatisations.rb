class CreatePrivatisations < ActiveRecord::Migration[7.0]
  def change
    create_table :privatisations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :date
      t.string :service
      t.string :people
      t.string :comment

      t.timestamps
    end
  end
end
