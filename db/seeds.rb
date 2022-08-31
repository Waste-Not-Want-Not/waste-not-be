require 'faker'

##USER 1
user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

#pantry items
7.times do
  user.items.create(name: Faker::Food.ingredient, location: "pantry", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
end
#freezer items
5.times do
  user.items.create(name: Faker::Food.ingredient, location: "freezer", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
end
#fridge items
6.times do
  user.items.create(name: Faker::Food.ingredient, location: "fridge", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
end
#items for donation
user.items.create(name: Faker::Food.ingredient, location: "fridge", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image, for_donation: true)
user.items.create(name: Faker::Food.ingredient, location: "pantry", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image, for_donation: true)
user.items.create(name: Faker::Food.ingredient, location: "freezer", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image, for_donation: true)

##USER 2 
user2 = User.create(name: Faker::Name.name, email: Faker::Internet.email)

#pantry items
7.times do
  user2.items.create(name: Faker::Food.ingredient, location: "pantry", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
end
#freezer items
5.times do
  user2.items.create(name: Faker::Food.ingredient, location: "freezer", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
end
#fridge items
6.times do
  user2.items.create(name: Faker::Food.ingredient, location: "fridge", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
end
#items for donation
user2.items.create(name: Faker::Food.ingredient, location: "fridge", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image, for_donation: true)
user2.items.create(name: Faker::Food.ingredient, location: "pantry", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image, for_donation: true)
user2ch
.items.create(name: Faker::Food.ingredient, location: "freezer", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image, for_donation: true)
