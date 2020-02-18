# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts '***** Je nettoie les DB'
Event.destroy_all
Attendance.destroy_all
User.destroy_all

# seed user
puts '-> Je charge un jeu d\'essai User'
30.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Name.first_name + "#{rand(9999)}@yopmail.com", #Faker::Internet.email,
    password: 'password'
  )
end
puts 'Jeu d\'essai User avec 10 items'

# seed Event
puts '-> Je charge un jeu d\'essai Event'
20.times do
  Event.create!(
    title: Faker::Lorem.sentence(3),
    description: Faker::Lorem.paragraph(3),
    start_date: Faker::Date.forward(90),
    duration: rand(1..30)*5,
    price: rand(1..1000),
    location: Faker::Address.community
    #manager: User.all.sample # à décommenter pour le prochain seed depuis la dernière update
  )
end
puts 'Jeu d\'essai Gossip avec 10 items'

# seed Attendance
puts '-> Je charge un jeu d\'essai Attendance'
10.times do
  Attendance.create!(
    user: User.all.sample,
    event: Event.all.sample,
    stripe_customer_id: Faker::Number.unique.number(16)
  )
end
puts 'Jeu d\'essai Attendance avec 10 items'
puts '***** Base de données chargée avec un seed ! Have a nive run.'

