# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :items, [Types::ItemType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :pantry_items, [Types::ItemType]
    field :fridge_items, [Types::ItemType]
    field :freezer_items, [Types::ItemType]

    def pantry_items
      object.items.location("pantry")
    end

    def fridge_items
      object.items.location("fridge")
    end

    def freezer_items
      object.items.location("freezer")
    end
  end
end
