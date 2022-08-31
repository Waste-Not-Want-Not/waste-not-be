class FoodBankFacade
  def self.get_info(location)
    food_json = FoodBankService.get_food(location)
    FoodBank.new(food_json)
  end
end
