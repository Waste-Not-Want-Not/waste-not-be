class Mutations::DeleteDonationItems < Mutations::BaseMutation
  argument :id, Integer, required: true

  field :message, String
  field :errors, String, null: false 

  def resolve(id:)
    user = User.find_by(id: id)
    if user != nil
      donation = user.items.where(for_donation: true)
      count = donation.count
      donation.each do |item|
        item.delete
      end
      {
        message: "#{count} donatable items have been deleted",
        errors: []
      }
    else 
      {
        message: 'Please input a valid User ID.',
        errors: 'User does not exist within our database.'
      }
    end
  end
end