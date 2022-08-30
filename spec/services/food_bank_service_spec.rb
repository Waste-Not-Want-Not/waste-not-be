require 'rails_helper'

RSpec.describe "Food API Service" do
  describe "happy path" do
    it "gives businesses with category and location", :vcr do
      foodbank = FoodBankService.get_food("denver,co")
      expect(foodbank.first[:name]).to be_a String
      expect(foodbank.first[:location]).to have_key :display_address
      expect(foodbank.first[:location][:display_address].join(" ")).to be_a String
    end
  end

  describe "sad path" do
    it "returns nil if no location/type is passed ", :vcr do
      foodbank = FoodBankService.get_food("")
      expect(foodbank).to eq(nil)
    end
  end
end
