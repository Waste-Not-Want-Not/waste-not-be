module Types
  class MutationType < Types::BaseObject
    field :create_item, mutation: Mutations::CreateItem
    field :update_for_donation, mutation: Mutations::UpdateForDonation
    field :delete_item, mutation: Mutations::DeleteItem
    field :delete_donation_items, mutation: Mutations::DeleteDonationItems
  end
end
