require 'rails_helper'

RSpec.describe "ItemFacade" do
  describe "happy path" do
    it "returns a iteam image url when called with a items name", :vcr do
      item_image = ItemImageFacade.get_image("apple")
      expect(item_image.url).to eq("https://images.pexels.com/photos/1453713/pexels-photo-1453713.jpeg")
    end
  end
end