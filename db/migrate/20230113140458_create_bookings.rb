class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :starts_at
      t.integer :people
      t.string :gender
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :comment
      t.string :status

      t.timestamps
    end
  end
end
