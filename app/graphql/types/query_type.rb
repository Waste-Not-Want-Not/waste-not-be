module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :get_users, [Types::UserType], null: false

    def get_users
      User.all
    end

    field :get_user_by_id, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def get_user_by_id(id:)
      User.find(id)
    end

    field :get_food_bank, Types::FoodBankType, null: false do
      argument :location, String, required: true
    end

    def get_food_bank(location:)
      info = FoodBankFacade.get_info(location)
      directions = RouteFacade.get_route(location, "#{info.address}")
      output = {
        name: info.name,
        address: info.address,
        phone_number: info.phone_number,
        directions: directions.directions_array.join(", ")
      }
    end

  end
end
