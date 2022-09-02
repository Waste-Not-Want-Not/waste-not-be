module Types
  class FoodBankType < Types::BaseObject
    field :location, String, null: false
    field :name, String
    field :address, String
    field :phone_number, String
    field :directions, String
  end
end
