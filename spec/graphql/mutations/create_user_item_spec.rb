require 'rails_helper'

RSpec.describe 'Create USer Items' do
  before :each do
    @user1 = User.create!(name: "Harry Potter", email: "hpotter@hogwarts.edu")
    @user1.items.create(name: "Peanut Butter", location: "pantry", expiration_date: Time.now, image: "www.peanutbutterimage.com")
    @user1.items.create(name: "Green Peas", location: "freezer", expiration_date: Time.now, image: "www.peasimage.com", for_donation: true)
    @user1.items.create(name: "Milk", location: "fridge", expiration_date: Time.now, image: "www.milkimage.com")

    @user2 = User.create!(name: "Ron Weasley", email: "rweasley@hogwarts.edu")
    @user2.items.create(name: "Chocolate", location: "Pantry", expiration_date: Time.now, image: "www.chocolateimage.com")
    @new_item = {name: "Apple", location: "fridge", expiration_date: Time.now, for_donation: false, user_id: @user1.id}
  end

  xit "creates a user's item with a graphql query", :vcr do

    mutation = <<~GQL
    mutation {
      createUserItem(input: {
            name: "#{@new_item[:name]}",
            expirationDate: "2022-09-24",
            userId: "#{@new_item[:user_id]}"
      })
      {
        item{
            name
            expirationDate
            location
            forDonation
            userId
            image
        }
      }
    }
    GQL

    response = WasteNotWantNotBeSchema.execute(mutation)
    binding.pry
    expect(@user1.items.last.name).to eq('Apple')
  end  
end