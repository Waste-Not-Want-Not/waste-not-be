class Mutations::UpdateItem < Mutations::BaseMutation
  argument :user_id, Integer, required: false
  argument :name, String, required: false
  argument :location, String, required: false
  argument :expiration_date, String, required: false
  # argument :image, String, required: false
  argument :for_donation, Boolean, required: false

  field :item, Types::ItemType, null: false 
  field :errors, [String], null: false 

  def resolve(name:, user_id:, location:, expiration_date:, for_donation:)
    item = Item.update(name: name, user_id: user_id, location: location, expiration_date: expiration_date, image: "fakeimage")
    binding.pry
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