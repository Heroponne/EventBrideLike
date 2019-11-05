# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Event.destroy_all
User.destroy_all

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "#{Faker::Name.first_name}@yopmail.fr", password: "foobar")
end

5.times do
  Event.create(start_date: Faker::Date.forward(days: 365), duration: [60, 90, 120].sample , title: Faker::Restaurant.name, description: Faker::Restaurant.description, price: rand(1..1000), location: "Dijon", admin: User.all.sample)
end
