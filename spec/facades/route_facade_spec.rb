require 'rails_helper'

RSpec.describe "Route Facade" do
  describe "happy path" do
    it "returns relevant Route info" do
      route_data = RouteFacade.get_route("5278 tall oaks court, huber heights, OH 45424", "donatos pizza, huber heights, OH")
      expect(route_data.formatted_time).to eq("09 Minutes")
      expect(route_data.directions_array).to eq(["Start out going north on Tall Oaks Ct toward Heather Way, and continue for 0.094 Miles",
        "Turn left onto Heather Way, and continue for 0.067 Miles",
        "Turn right onto Brentwood Dr, and continue for 0.186 Miles",
        "Turn right onto Bellefontaine Rd, and continue for 0.925 Miles",
        "Turn left onto Fishburg Rd, and continue for 1.757 Miles",
        "Turn right onto Troy Pike/OH-202, and continue for 1.713 Miles",
        "Turn right onto Huber Rd, and continue for 0.074 Miles",
        "HUBER ROAD, and continue for 0 Miles"])
    end
  end
end
