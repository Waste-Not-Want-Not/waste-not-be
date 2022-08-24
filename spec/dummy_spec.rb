require 'rails_helper'

RSpec.describe "dummy test" do
  it "tells us if Nick is a squirrel" do
    is_nick_a_squirrel = true
    expect(is_nick_a_squirrel).to eq(true)
  end
end