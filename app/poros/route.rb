class Route
  attr_reader :unformatted_time, :directions_array

  def initialize(route_data)
    @unformatted_time = route_data[:route][:formattedTime]
    @directions_array = directions(route_data)
  end

  def formatted_time
    unformatted = @unformatted_time.split(":")
    if unformatted[0] == "00"
      formatted_time = "#{unformatted[1]} Minutes"
    else
      formatted_time = "#{unformatted[0]} Hours, #{unformatted[1]} Minutes"
    end
    return formatted_time
  end

  def directions(route_data)
    direction_array = []
    route_data[:route][:legs].first[:maneuvers].each do |leg|
      direction_array << "#{leg[:narrative].gsub(".",",")} and continue for #{leg[:distance]} Miles"
    end
    direction_array
  end

end
