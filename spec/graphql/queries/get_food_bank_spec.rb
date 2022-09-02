require 'rails_helper'

RSpec.describe 'Get Food Bank Info with location' do

  it "returns foodbank data when passed a location arguement", :vcr do

    query = <<~GQL
    query {
      getFoodBank(location: "dayton, oh") {
        name
        address
        phoneNumber
        directions
      }
    }
    GQL

    result = WasteNotWantNotBeSchema.execute(query)
    expect(result.dig("data", "getFoodBank", "name")).to eq("Freestore Foodbank")
    expect(result.dig("data", "getFoodBank", "address")).to eq("112 E Liberty St, Cincinnati, OH 45202")
    expect(result.dig("data", "getFoodBank", "phoneNumber")).to eq("(513) 241-1064")
    expect(result.dig("data", "getFoodBank", "directions")).to eq("Start out going west on W 2Nd St toward N Ludlow St, and continue for 0.426 Miles, Keep left at the fork to continue on W 2Nd St, and continue for 0.376 Miles, Turn slight right onto I-75 S, and continue for 50.92 Miles, Take the Western Ave exit, EXIT 2A, toward Liberty St, and continue for 0.229 Miles, Keep left to take the ramp toward MUSIC HALL/MUSEUM CENTER, and continue for 0.032 Miles, Stay straight to go onto Western Ave, and continue for 0.18 Miles, Turn left onto W Liberty St, and continue for 0.999 Miles, 112 E LIBERTY ST is on the left, and continue for 0 Miles")
  end

end
