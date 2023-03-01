# frozen_string_literal: true

require 'faker'

####################################################
#### ADMIN USER
# admin_user = User.new(email: 'admin13@gmail.com', password: 'admin13')
# admin_user.save!

####################################################
#### MEALS
# puts 'Creating Starters'
# starter1 = Meal.create(
#   title: 'Name of the starter 1',
#   description: 'A description of the starter 1 with some details.',
#   price: 8,
#   dish: 'Starter'
# )
# starter1.save!

# starter2 = Meal.create(
#   title: 'Name of the starter 2',
#   description: 'A description of the starter 2 with some details.',
#   price: 9,
#   dish: 'Starter'
# )
# starter2.save!

# puts 'Creating Main Meals'
# meals1 = Meal.create(
#   title: 'Name of the Meal 1',
#   description: 'A description of the Meal 1 with some details.',
#   price: 17,
#   dish: 'Main meal'
# )
# meals1.save!

# meals2 = Meal.create(
#   title: 'Name of the Meal 2',
#   description: 'A description of the Meal 2 with some details.',
#   price: 19,
#   dish: 'Main meal'
# )
# meals2.save!

# meals3 = Meal.create(
#   title: 'Name of the Meal 3',
#   description: 'A description of the Meal 3 with some details.',
#   price: 18,
#   dish: 'Main meal'
# )
# meals3.save!

# puts 'Creating Desserts'
# dessert1 = Meal.create(
#   title: 'Name of the Dessert 1',
#   description: 'A description of the Dessert 1 with some details.',
#   price: 17,
#   dish: 'Dessert'
# )
# dessert1.save!

# dessert2 = Meal.create(
#   title: 'Name of the Dessert 2',
#   description: 'A description of the Dessert 2 with some details.',
#   price: 19,
#   dish: 'Dessert'
# )
# dessert2.save!

####################################################
#### BOOKINGS
n = 0
20.times do
  b = Booking.new(
    date: (Date.today + rand(1..30)),
    people: rand(2..8),
    gender: Faker::Name.prefix,
    first_name: Faker::Name.name,
    last_name: Faker::Name.last_name,
    phone: '0611223344',
    email: Faker::Internet.email,
    comment: Faker::Lorem.sentence,
    status: 'pending'
  )
  b.starts_at = Time.new(b.date.year, b.date.month, b.date.day,
                         [11, 12, 13, 19, 20, 21].sample, [0, 15, 30, 45].sample, 0, '+00:00')

  if b.save
    puts "Test booking #{n} => successfully created !"
  else
    puts 'Seeding failure => please try again.'
  end

  n += 1
end
