# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin_user = User.new(email: "admin13@gmail.com", password: "admin13")
admin_user.save!

####################################################
#### MENUS
puts "Creating Starters"
starter1 = Menu.create(
  content: "A description of the starter 1 with some details.",
  title: "Name of the starter 1",
  price: 8,
  meal: "starter"
)
starter1.save!

starter2 = Menu.create(
  content: "A description of the starter 2 with some details.",
  title: "Name of the starter 2",
  price: 9,
  meal: "starter"
)
starter2.save!

puts "Creating Main Meals"
meals1 = Menu.create(
  content: "A description of the Meal 1 with some details.",
  title: "Name of the Meal 1",
  price: 17,
  meal: "Main meal"
)
meals1.save!

meals2 = Menu.create(
  content: "A description of the Meal 2 with some details.",
  title: "Name of the Meal 2",
  price: 19,
  meal: "Main meal"
)
meals2.save!

meals3 = Menu.create(
  content: "A description of the Meal 3 with some details.",
  title: "Name of the Meal 3",
  price: 18,
  meal: "Main meal"
)
meals3.save!

puts "Creating Desserts"
dessert1 = Menu.create(
  content: "A description of the Dessert 1 with some details.",
  title: "Name of the Dessert 1",
  price: 17,
  meal: "Dessert"
)
dessert1.save!

dessert2 = Menu.create(
  content: "A description of the Dessert 2 with some details.",
  title: "Name of the Dessert 2",
  price: 19,
  meal: "Dessert"
)
dessert2.save!

####################################################
#### BOOKINGS

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
