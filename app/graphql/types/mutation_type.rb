module Types
  class MutationType < Types::BaseObject
    field :create_user_item, mutation: Mutations::CreateUserItem
    field :create_item, mutation: Mutations::CreateItem
    field :update_item, mutation: Mutations::UpdateItem
  end
end
