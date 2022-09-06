
class Mutations::CreateUserItem < Mutations::BaseMutation 
    # null false
    argument :user_id, String, required: true
    argument :name, String, required: true
    argument :location, String, required: true
    argument :expiration_date, String, required: true
    argument :image, String, required: false
    argument :for_donation, String, required: false
    
    field :item, Types::ItemType, null: false
    field :errors, [String], null: false
    def resolve(user_id:, name:, location:, expiration_date:)
        @user = User.find(user_id)
        @item = @user.items.create!(name: name,  location: location, expiration_date: expiration_date, for_donation: false, image: ItemImageFacade.get_image(name).url)
        if @item.save
            {
                item: @item,
                errors:[]
            }
        else
            {
                item: nil,
                errors: @item.errors.full_messages
            }
        end
    end

    def item_by_id(id)
        Item.where(id: id)
    end
end