module Types
  class MutationType < Types::BaseObject
    field :create_item, mutation: Mutations::CreateItem
  end
end
