class FoodBankService

  def self.connection
    Faraday.new(url: "https://api.yelp.com/v3/businesses/search", headers: {'Authorization'=>ENV['YELP_API_KEY']})
  end

  def self.get_food(location)
    response = connection.get do |p|
      p.params[:location] = location
      p.params[:term] = "foodbank"
    end
    JSON.parse(response.body, symbolize_names: true)[:businesses]
  end

end
