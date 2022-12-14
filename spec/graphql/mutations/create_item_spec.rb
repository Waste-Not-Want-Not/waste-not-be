require 'rails_helper'

RSpec.describe 'Create Item' do
  it "creates an item and returns its information", :vcr do
    user1 = User.create!(name: "Harry Potter", email: "hpotter@hogwarts.edu")

    query = <<~GQL
    mutation {
      createItem(input: {
        name:"Spinach",
        location: "fridge",
        expirationDate: "2001-02-03T04:05:06+00:00"
        userId: #{user1.id},
      }) {
        item {
          name,
          location
          expirationDate
          userId
          image
          forDonation
          id
        }
        errors
      }
    }

    GQL

    result = WasteNotWantNotBeSchema.execute(query)
    item = result.dig("data", "createItem", "item")

    expect(item["name"]).to eq("Spinach")
    expect(item["location"]).to eq("fridge")
    expect(item["expirationDate"]).to eq("2001-02-03T04:05:06Z")
    expect(item["userId"]).to be_an Integer
    expect(item["image"]).to be_a String
    expect(item["forDonation"]).to eq(false)

  end

  it "creates an item and returns its information", :vcr do
    user1 = User.create!(name: "Harry Potter", email: "hpotter@hogwarts.edu")

    query = <<~GQL
    mutation {
      createItem(input: {
        name:"Spinach",
        location: "fridge",
        expirationDate: "2001-02-03T04:05:06+00:00"
        userId: 50,
      }) {
        item {
          name,
          location
          expirationDate
          userId
          image
          forDonation
          id
        }
        errors
      }
    }

    GQL

    result = WasteNotWantNotBeSchema.execute(query)
    # binding.pry
    expect(result.first.second["createItem"]["errors"].first).to eq("User must exist")
    expect(result.first.second["createItem"]["item"]).to eq(nil)
  end
end
