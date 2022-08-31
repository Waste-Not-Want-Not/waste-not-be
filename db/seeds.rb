# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

7.times do
  user.items.create(name: Faker::Food.ingredient, location: "pantry", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
end

5.times do
  user.items.create(name: Faker::Food.ingredient, location: "freezer", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
end

6.times do
  user.items.create(name: Faker::Food.ingredient, location: "fridge", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
end