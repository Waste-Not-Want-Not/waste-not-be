module Types
  class MutationType < Types::BaseObject
<<<<<<< HEAD
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end

    field :create_user_item, mutation: Mutations::CreateUserItem
=======
    field :create_item, mutation: Mutations::CreateItem
>>>>>>> e07a710d9a7900d0b5490109c26829fbbb256383
  end
end
