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
      getUserById(id: #{user1.id}) {
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

    expect(result.dig("data", "getUserById", "name")).to eq("Harry Potter")
    expect(result.dig("data", "getUserById", "email")).to eq("hpotter@hogwarts.edu")
    expect(result.dig("data", "getUserById", "items")).to be_an Array
  end  
end