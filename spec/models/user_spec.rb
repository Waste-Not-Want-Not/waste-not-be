require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:items) }
  end

  context 'instance methods' do
    describe 'user.items.location(location)' do
      it 'returns the users items in a specific location only' do
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

        expect(user.items.count).to eq(18)
        expect(user.items.location("pantry").count).to eq(7)
        expect(user.items.location("freezer").count).to eq(5)
        expect(user.items.location("fridge").count).to eq(6)
    
      end
    end
   
    describe 'user.items.for_donation' do
      it 'returns the users items for donation' do
        user = User.create(name: Faker::Name.name, email: Faker::Internet.email)

        2.times do
          user.items.create(name: Faker::Food.ingredient, location: "pantry", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image)
        end

        3.times do
          user.items.create(name: Faker::Food.ingredient, location: "freezer", expiration_date: Faker::Date.between(from: Date.today, to: 30.days.from_now) , image: Faker::LoremFlickr.image, for_donation: true)
        end

        expect(user.items.count).to eq(5)
        expect(user.items.for_donation.count).to eq(3)  
      end
    end
  end
end
