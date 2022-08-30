require 'rails_helper'

RSpec.describe "Mapquest Route API" do

  it "can give route information when given two locations", :vcr do
    route_info = RouteService.get_route("5278 Tall Oaks Ct, Huber Heights, OH","Kitridge Road, Datyon, OH")
    expect(route_info[:route]).to have_key :formattedTime
    expect(route_info[:route][:formattedTime]).to be_a String
    expect(route_info[:route][:realTime]).to be_a Integer
  end

end
