require 'rails_helper'

RSpec.describe 'Delete Items For Donation' do
  before :each do
    @user1 = User.create!(name: "Harry Potter", email: "hpotter@hogwarts.edu")
    @user1.items.create(name: "Peanut Butter", location: "pantry", expiration_date: Time.now, image: "www.peanutbutterimage.com")
    @user1.items.create(name: "Green Peas", location: "freezer", expiration_date: Time.now, image: "www.peasimage.com", for_donation: true)
    @user1.items.create(name: "Milk", location: "fridge", expiration_date: Time.now, image: "www.milkimage.com", for_donation: true)
    @user1.items.create(name: "Banana", location: "fridge", expiration_date: Time.now, image: "www.peasimage.com", for_donation: true)
    @user1.items.create(name: "Ketchup", location: "fridge", expiration_date: Time.now, image: "www.milkimage.com")

    @user2 = User.create!(name: "Ron Weasley", email: "rweasley@hogwarts.edu")
    @user2.items.create(name: "Chocolate", location: "Pantry", expiration_date: Time.now, image: "www.chocolateimage.com")
  end

  it "deletes all user's item's that are for donation", :vcr do

    mutation = <<~GQL
    mutation {
      deleteDonationItems(input: { id: #{@user1.id}
      })
      {
        message
      }
    }
    GQL
    response = WasteNotWantNotBeSchema.execute(mutation)
    expect(response.first.second["deleteDonationItems"]["message"]).to eq("Please input a valid User ID.")
    expect(response.first.second["deleteDonationItems"]["errors"]).to eq("User does not exist within our database.")
    expect(@user1.items.count).to eq(2)
  end  

    it "returns a error if the ID doesnt belong to a user", :vcr do

        mutation = <<~GQL
        mutation {
        deleteDonationItems(input: { id: 100000000
        })
        {
            message
            errors
        }
        }
        GQL
        response = WasteNotWantNotBeSchema.execute(mutation)
        expect(response.first.second["deleteDonationItems"]["message"]).to eq("Please input a valid User ID.")
        expect(response.first.second["deleteDonationItems"]["errors"]).to eq("User does not exist within our database.")
    end  
end