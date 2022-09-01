class ItemImageService

  def self.connection
    Faraday.new(url: "https://api.pexels.com/v1/search", headers: {'Authorization'=>ENV['PEXELS_API_KEY']})
  end

  def self.get_item_image(item)
    response = connection.get do |p|
      p.params[:query] = "#{item}s"
      p.params[:per_page] = 1
    end
    image = JSON.parse(response.body, symbolize_names: true)[:photos][0][:src][:original]
  end

end