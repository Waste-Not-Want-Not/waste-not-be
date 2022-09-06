require 'rails_helper'

RSpec.describe 'Delete Items' do
  before :each do
    @user1 = User.create!(name: "Harry Potter", email: "hpotter@hogwarts.edu")
    @item1 = @user1.items.create(name: "Peanut Butter", location: "pantry", expiration_date: Time.now, image: "www.peanutbutterimage.com")
    @user1.items.create(name: "Green Peas", location: "freezer", expiration_date: Time.now, image: "www.peasimage.com", for_donation: true)
    @user1.items.create(name: "Milk", location: "fridge", expiration_date: Time.now, image: "www.milkimage.com")
  end

  it "deletes a user's item with a graphql query", :vcr do

    mutation = <<~GQL
    mutation {
      deleteItem(input: { id: #{@item1.id}
      })
      {
        id
        errors
      }
    }
    GQL
    response = WasteNotWantNotBeSchema.execute(mutation)
    expect(@user1.items.count).to eq(2)
    expect(response.first.second["deleteItem"]["id"]).to eq(@item1.id)
    expect(response.first.second["deleteItem"]["errors"]).to eq("[]")
  end

  it "returns error message for a user's item that doesnt exist with a graphql query", :vcr do

    mutation = <<~GQL
    mutation {
      deleteItem(input: { id: 10000
      })
      {
        id
        errors
      }
    }
    GQL
    response = WasteNotWantNotBeSchema.execute(mutation)
    expect(response.first.second["deleteItem"]["errors"]).to eq('Item does not exist within our database.')
    expect(response.first.second["deleteItem"]["id"]).to eq(nil)

  end

end
