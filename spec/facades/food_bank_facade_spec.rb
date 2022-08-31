require 'rails_helper'

RSpec.describe "FoodFacade" do
  describe "happy path" do
    it "returns relevant food info", :vcr do
      food_data = FoodBankFacade.get_info("denver,co")
      expect(food_data.name).to eq("Food Bank of the Rockies")
      expect(food_data.address).to eq("10700 E 45th Ave, Denver, CO 80239")
    end
  end
end
