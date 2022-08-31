class FoodBank
  attr_reader :name, :address, :phone_number

  def initialize(food_data)
    @name = food_data.first[:name]
    @address = food_data.first[:location][:display_address].join(", ")
    @phone_number = food_data.first[:display_phone]

  end

end
