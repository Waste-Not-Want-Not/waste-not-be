require 'rails_helper'

RSpec.describe "Item Image API Service" do
  describe "happy path" do
    it "gives a image as a return when inputting a items name", :vcr do
      item_image = ItemImageService.get_item_image("apple")
      expect(item_image).to eq("https://images.pexels.com/photos/1453713/pexels-photo-1453713.jpeg")
    end
  end
end