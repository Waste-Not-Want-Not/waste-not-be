require 'rails_helper'

RSpec.describe "Get User by ID" do
  xit "" do
    user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

    2.times do
      user.items.create(name: Faker::Food.ingredient, location: "pantry", expiration_date: Time.now, image: Faker::LoremFlickr.image)
    end
  end


end
