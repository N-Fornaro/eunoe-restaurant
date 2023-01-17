# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

b = Booking.new(
  date: (Date.today + 1),
  people: 4,
  gender: "M.",
  first_name: "Antoine",
  last_name: "Mariani",
  phone: "0611223344",
  email: "hello@amariani.dev",
  comment: "pas de frites svp",
  status: "pending",
)
b.starts_at = Time.new(b.date.year, b.date.month, b.date.day,
20, 0, 0, "+00:00")

if b.save!
  puts "Test booking => successfully created !"
else
  puts "Seeding failure => please try again."
end
