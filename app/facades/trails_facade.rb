class TrailsFacade
  attr_reader :lat,
              :long,
              :location

  def initialize(lat, long, location)
    @lat = lat
    @long = long
    @location = location
  end

  def trails
    trails_service[:trails].map do |trail_data|
      Trail.new(trail_data, @location)
    end
  end

  private

  def trails_service
    TrailsService.new.get_trails(lat, long)
  end

  def weather_service
    WeatherService.new.get_weather(lat, long)
  end

  def map_service_distance_between
    MapService.new.get_distance_between(@location, @trail_location)[:route][:distance]
  end

  def map_service
    MapService.new.get_geocode(@location)[:results][0][:locations][0]
  end

  def lat
    map_service[:latLng][:lat]
  end

  def long
    map_service[:latLng][:lng]
  end
end
