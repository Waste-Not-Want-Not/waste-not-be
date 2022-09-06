class Mutations::CreateItem < Mutations::BaseMutation
  argument :user_id, Integer, required: true
  argument :name, String, required: true
  argument :location, String, required: true
  argument :expiration_date, String, required: true
  # argument :image, String, required: false
  # argument :for_donation, Boolean, required: false

  field :item, Types::ItemType
  field :errors, [String], null: false

  def resolve(name:, user_id:, location:, expiration_date:)
    item_image = ItemImageFacade.get_image(name)
    item = Item.new(name: name, user_id: user_id, location: location, expiration_date: expiration_date, image: item_image.url)

    if item.save
      {
        item: item,
        errors: []
      }
    else
      {
        item: nil,
        errors: item.errors.full_messages
      }
    end
  end
end
