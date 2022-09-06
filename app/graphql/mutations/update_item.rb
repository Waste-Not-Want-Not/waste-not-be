class Mutations::UpdateItem < Mutations::BaseMutation
  argument :name, String, required: false
  argument :location, String, required: false
  argument :expiration_date, String, required: false
  argument :for_donation, String, required: false
  argument :id, Integer, required: true

  field :item, Types::ItemType, null: false 
  field :errors, [String], null: false 

  def resolve(name:, location:, expiration_date:, for_donation:, id:)
    item = Item.find(id)
    update = item.update!(name: name, location: location, expiration_date: expiration_date, for_donation: for_donation)
    if update == true 
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