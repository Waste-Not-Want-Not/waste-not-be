require 'rails_helper'

RSpec.describe "ItemImage" do
  describe "happy path" do
    it "returns a item image as a plain old ruby object", :vcr do
      image = ItemImageService.get_item_image("apple")
      item_image = ItemImage.new(image)
      expect(item_image).to be_a ItemImage
      expect(item_image.url).to eq("https://images.pexels.com/photos/1453713/pexels-photo-1453713.jpeg")
    end
  end
end