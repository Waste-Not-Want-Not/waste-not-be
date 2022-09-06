class Mutations::DeleteItem < Mutations::BaseMutation
  argument :id, Integer, required: true

  # field :item, Types::ItemType
  field :id, Integer
  field :errors, String, null: false

  def resolve(id:)
    item = Item.find_by(id: id)
    if item != nil
      item.delete
      {
        id: id,
        errors: []
      }
    else
      {
        id: nil,
        errors: 'Item does not exist within our database.'
      }
    end
  end
end
