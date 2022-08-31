require 'rails_helper'

RSpec.describe 'Get User By ID query' do
  it "returns a user and their items by id" do
    user1 = User.create!(name: "Harry Potter", email: "hpotter@hogwarts.edu")
    user2 = User.create!(name: "Ron Weasley", email: "rweasley@hogwarts.edu")

    user1.items.create(name: "Peanut Butter", location: "Pantry", expiration_date: Time.now, image: "www.peanutbutterimage.com")
    user1.items.create(name: "Grean Peas", location: "Freezer", expiration_date: Time.now, image: "www.peasimage.com")
    user2.items.create(name: "Chocolate", location: "Pantry", expiration_date: Time.now, image: "www.chocolateimage.com")

    query = <<~GQL
    query {
      getUsers {
        name
        email
        items {
            name
            expirationDate
            location
            forDonation
        }
      }
    }
    GQL

    result = WasteNotWantNotBeSchema.execute(query)
    users = result.dig("data", "getUsers").map { |user| user["name"]}
    expect(users).to match_array(["Harry Potter", "Ron Weasley"])
  end  
end