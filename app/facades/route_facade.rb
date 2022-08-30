class RouteFacade

  def self.get_route(start,finish)
    route_json = RouteService.get_route(start,finish)
    Route.new(route_json)
  end

end
