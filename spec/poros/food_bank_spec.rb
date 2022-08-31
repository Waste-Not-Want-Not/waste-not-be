require 'rails_helper'

RSpec.describe FoodBank do
  before :each do
    @food_bank_data = JSON.parse(File.read('spec/fixtures/food_bank_example.json'), symbolize_names: true)
    @food_bank_object = FoodBank.new(@food_bank_data[:businesses])
  end
  describe "happy path" do
    it "creates a food object when passed location and type of food" do
      expect(@food_bank_object.name).to eq("Food Bank of the Rockies")
      expect(@food_bank_object.name).to eq(@food_bank_data[:businesses].first[:name])
      expect(@food_bank_object.address).to eq("10700 E 45th Ave, Denver, CO 80239")
      expect(@food_bank_object.phone_number).to eq("(303) 371-9250")
    end
  end

  describe "sad path" do
    it "address is formatted properly and doesnt look the same as the json response" do
      expect(@food_bank_object.address).to_not eq(@food_bank_data[:businesses].first[:display_address])
    end
  end
end
