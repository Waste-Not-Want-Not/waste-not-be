class Mutations::UpdateForDonation < Mutations::BaseMutation
  argument :id, Integer, required: true

  field :item, Types::ItemType
  field :errors, String, null: false 

  def resolve(id:)
    item = Item.find_by(id: id)
    if item != nil
      item.for_donation = true
      item.save
      {
        item: item,
        errors: []
      }
    else 
      {
        item: nil,
        errors: 'Item does not exist within our database.'
      }
    end
  end
end