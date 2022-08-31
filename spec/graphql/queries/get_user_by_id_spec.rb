require 'rails_helper'

RSpec.describe 'Get User By ID query' do
  before do
    @user1 = User.create!(name: "Harry Potter", email: "hpotter@hogwarts.edu")
    @user1.items.create(name: "Peanut Butter", location: "pantry", expiration_date: Time.now, image: "www.peanutbutterimage.com")
    @user1.items.create(name: "Green Peas", location: "freezer", expiration_date: Time.now, image: "www.peasimage.com")
    @user1.items.create(name: "Milk", location: "fridge", expiration_date: Time.now, image: "www.milkimage.com")

    @user2 = User.create!(name: "Ron Weasley", email: "rweasley@hogwarts.edu")
    @user2.items.create(name: "Chocolate", location: "Pantry", expiration_date: Time.now, image: "www.chocolateimage.com")

  end

  it "returns a user by id" do

    query = <<~GQL
    query {
      getUserById(id: #{@user1.id}) {
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

  it "returns the user by ID and their items" do
    query = <<~GQL
    query {
      getUserById(id: #{@user1.id}) {
        name
        email
        items {
            name
            expirationDate
            location
            forDonation
            image
        }
      }
    }
    GQL

    result = WasteNotWantNotBeSchema.execute(query)
    user_items = result.dig("data", "getUserById", "items")
    expect(user_items).to be_an Array
    expect(user_items.count).to eq(3)
    expect(user_items.first["name"]).to eq("Peanut Butter")
    expect(user_items.first["location"]).to eq("pantry")
    expect(user_items.first["expirationDate"]).to be_a String
    expect(user_items.first["image"]).to eq("www.peanutbutterimage.com")
    expect(user_items.first["forDonation"]).to eq(false)
  end

  context 'items by location' do
    it 'returns the user by id and their items in the pantry' do
      query = <<~GQL
      query {
        getUserById(id: #{@user1.id}) {
          name
          email
          pantryItems {
              name
              expirationDate
              location
              forDonation
              image
          }
        }
      }
      GQL
      result = WasteNotWantNotBeSchema.execute(query)
      user_items = result.dig("data", "getUserById", "pantryItems")
      expect(user_items).to be_an Array
      expect(user_items.count).to eq(1)
      expect(user_items.first["name"]).to eq("Peanut Butter")
    end

    it 'returns the user by id and their items in the freezer' do
      query = <<~GQL
      query {
        getUserById(id: #{@user1.id}) {
          name
          email
          freezerItems {
              name
              expirationDate
              location
              forDonation
              image
          }
        }
      }
      GQL
      result = WasteNotWantNotBeSchema.execute(query)
      user_items = result.dig("data", "getUserById", "freezerItems")
      expect(user_items).to be_an Array
      expect(user_items.count).to eq(1)
      expect(user_items.first["name"]).to eq("Green Peas")
    end

    it 'returns the user by id and their items in the fridge' do
      query = <<~GQL
      query {
        getUserById(id: #{@user1.id}) {
          name
          email
          fridgeItems {
              name
              expirationDate
              location
              forDonation
              image
          }
        }
      }
      GQL
      result = WasteNotWantNotBeSchema.execute(query)
      user_items = result.dig("data", "getUserById", "fridgeItems")
      expect(user_items).to be_an Array
      expect(user_items.count).to eq(1)
      expect(user_items.first["name"]).to eq("Milk")
    end
  end 
end