class ItemImageFacade
  def self.get_image(item)
    image = ItemImageService.get_item_image(item)
    ItemImage.new(image)
  end
end