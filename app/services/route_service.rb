class RouteService

  def self.connection
    Faraday.new(url: 'http://www.mapquestapi.com/')
  end

  def self.get_route(start, finish)
    response = connection.post('directions/v2/route') do |form|
      form.params['key'] = ENV['MAPQUEST_API_KEY']
      form.params['from'] = start
      form.params['to'] = finish
    end
    JSON.parse(response.body, symbolize_names: true)
  end

end
