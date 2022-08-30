require "rails_helper"

RSpec.describe Route do

  it "creates a route object from JSON response" do
    json = JSON.parse(File.read('spec/fixtures/short_route_example.json'), symbolize_names: true)
    route = Route.new(json)
    expect(route.seconds).to eq(112)
    expect(route.unformatted_time).to eq("00:01:52")
  end

  it "only shows minutes if less than 1 hour" do
    json = JSON.parse(File.read('spec/fixtures/short_route_example.json'), symbolize_names: true)
    route = Route.new(json)

    expect(route.formatted_time).to eq("01 Minutes")
  end

  it "gives hours and minutes if longer than 1 hour" do
    json = JSON.parse(File.read('spec/fixtures/long_route_example.json'), symbolize_names: true)
    route = Route.new(json)
    expect(route.formatted_time).to eq("13 Hours, 52 Minutes")
  end

  it "gives step by step directions to destination" do
    json = JSON.parse(File.read('spec/fixtures/short_route_example.json'), symbolize_names: true)
    route = Route.new(json)

    expect(route.directions(json)).to be_a Array
    expect(route.directions(json)).to eq(["Start out going north on Tall Oaks Ct toward Heather Way, and continue for 0.094 Miles",
      "Turn left onto Heather Way, and continue for 0.301 Miles",
      "Turn left onto Kitridge Rd, and continue for 0.049 Miles",
      "[4200 - 5999] KITRIDGE RD, and continue for 0 Miles"])
  end
end
