# frozen_string_literal: true

require 'faker'

User.destroy_all
Meal.destroy_all
Booking.destroy_all

####################################################
#### ADMIN USER
admin_user = User.new(email: 'admin13@gmail.com', password: 'admin13')
admin_user.save!

####################################################
#### MEALS

# MEALS - LUNCH
puts '-- Menu Lunch --'
puts 'Creating Starters'
starter1 = Meal.create(
  title: 'Entrée du jour',
  description: "Description de l entrée",
  price: 8,
  dish: 'Starter',
  timing: 'Lunch'
)
starter1.save!

starter2 = Meal.create(
  title: 'Entrée du jour',
  description: "Description de l'entrée",
  price: 8,
  dish: 'Starter',
  timing: 'Lunch'
)
starter2.save!

starter3 = Meal.create(
  title: 'Entrée du jour',
  description: "Description de l'entrée",
  price: 8,
  dish: 'Starter',
  timing: 'Lunch'
)
starter3.save!

puts 'Creating Main Meals'
main1 = Meal.create(
  title: 'Plat du jour Titre',
  description: 'Description du plat du jour et ses aliments',
  price: 14,
  dish: 'Main meal',
  timing: 'Lunch'
)
main1.save!

main2 = Meal.create(
  title: 'Plat du jour Titre',
  description: 'Description du plat du jour et ses aliments',
  price: 14,
  dish: 'Main meal',
  timing: 'Lunch'
)
main2.save!

main3 = Meal.create(
  title: 'Plat du jour Titre',
  description: 'Description du plat du jour et ses aliments',
  price: 14,
  dish: 'Main meal',
  timing: 'Lunch'
)
main3.save!

puts 'Creating Desserts'
dessert1 = Meal.create(
  title: 'Dessert du jour Titre',
  description: 'Description du dessert du jour et ses aliments',
  price: 7,
  dish: 'Dessert',
  timing: 'Lunch'
)
dessert1.save!

dessert2 = Meal.create(
  title: 'Dessert du jour Titre',
  description: 'Description du dessert du jour et ses aliments',
  price: 7,
  dish: 'Dessert',
  timing: 'Lunch'
)
dessert2.save!

# MEALS - DINNER
puts '-- Menu Dinner --'
puts 'Creating Starters'
starter4 = Meal.create(
  title: 'Légumes de saison Crus, Fermentés et Crème Labneh',
  description: 'Rencontre entre notre maraicher Yasai et les inspirations libanaises de Ryuji.',
  price: 9,
  dish: 'Starter',
  timing: 'Dinner'
)
starter4.save!

starter5 = Meal.create(
  title: 'Nid d’œuf mayo / cheveux d’ange, aïoli au Tenmenjan',
  description: 'Inspiaration d’œuf mayo mais comme dirait Ryuji  « ça c’est trop normal »
  ',
  price: 10,
  dish: 'Starter',
  timing: 'Dinner'
)
starter5.save!

starter6 = Meal.create(
  title: 'Terrine de Foie gras de Mer, jus d’hibiscus acidulé, salade d’herbe',
  description: 'Déjà 3 années que le meilleur pâté en croute du monde est réalisé par des Japonais, si tu es membres du jury, sache que l’on veut concourir.',
  price: 14,
  dish: 'Starter',
  timing: 'Dinner'
)
starter6.save!

starter7 = Meal.create(
  title: 'Asperges verte de Provence grillé au charbon, Sabayon de basilic',
  description: 'En souvenir de Louis XIV qui en mangeait toute l’année.',
  price: 15,
  dish: 'Starter',
  timing: 'Dinner'
)
starter7.save!


starter8 = Meal.create(
  title: 'Tartare de bœuf Simmental, œufs de saumon, mizuna, Vrai wasabi',
  description: 'Un tartare que les Japonais nous envient puisqu’ils n’ont pas le droit de manger de bœuf cru (depuis la date).',
  price: 16,
  dish: 'Main meal',
  timing: 'Dinner'
)
starter8.save!

puts 'Creating Main Meals'
main4 = Meal.create(
  title: 'Lotte - Rôtie au charbon, coriandre, crème d’anchois, Fregola à l’encre de seiche',
  description: 'Suite à un voyage en Sardaigne, Ryuji est tombé amoureux de cette « petite miette » Sarde.',
  price: 25,
  dish: 'Main meal',
  timing: 'Dinner'
)
main4.save!

main5 = Meal.create(
  title: 'Pintade - Marinée au Koji grillé au charbon, jus de corsé, calçot',
  description: 'On a revisité le Yakitori Nejima, célèbre brochette japonaise de volaille et poireaux.',
  price: 24,
  dish: 'Main meal',
  timing: 'Dinner'
)
main5.save!

main6 = Meal.create(
  title: 'Agneau de lait de Pyrénées rôti surprise (2 personnes)',
  description: 'Jus d’agneau, ail des ours, piquillos, à partager.
  On reçoit les agneaux entiers de Gillen au pays Basque, on les magnifie. Tout est bon dans l’agneau les ami(e)s, impossible donc de choisir son morceau !',
  price: 34,
  dish: 'Main meal',
  timing: 'Dinner'
)
main6.save!

puts 'Creating Desserts'
dessert3 = Meal.create(
  title: 'Fromage affiné du moment',
  description: '« Un millefeuilles de fromages de perruche. Non du Perche Ryuji ! »',
  price: 10,
  dish: 'Dessert',
  timing: 'Dinner'
)
dessert3.save!

dessert4 = Meal.create(
  title: 'Trio fromage',
  description: 'Juste parce que jamais un sans trois !',
  price: 14,
  dish: 'Dessert',
  timing: 'Dinner'
)
dessert4.save!

####################################################
#### BOOKINGS
n = 0
200.times do
  b = Booking.new(
    date: (Date.today + rand(1..60)),
    people: rand(2..8),
    gender: Faker::Name.prefix,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    phone: Faker::PhoneNumber.phone_number_with_country_code,
    email: Faker::Internet.email,
    comment: Faker::Lorem.sentence
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
