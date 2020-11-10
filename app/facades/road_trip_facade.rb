class RoadTripFacade
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip
    data = {
      origin: @origin,
      destination: @destination,
      travel_time: map_service_travel_time_numeric,
      travel_time_string: map_service_travel_time_string,
      forecast_at_eta: forecast_at_eta
    }
    
    RoadTrip.new(data)
  end

  def forecast_at_eta
    data = weather_service[:hourly].find do |weather|
      weather[:dt] >= DateTime.now.to_i + map_service_travel_time_numeric
    end

    RoadTripWeatherSummary.new(data)
  end

  private

  def weather_service
    WeatherService.new.get_weather(lat, long)
  end

  def map_service_travel_time_numeric
    MapService.new.get_distance_between(@origin, @destination)[:route][:legs][0][:time]
  end

  def map_service_travel_time_string
    MapService.new.get_distance_between(@origin, @destination)[:route][:formattedTime]
  end

  def map_service
    MapService.new.get_geocode(@destination)[:results][0][:locations][0]
  end

  def lat
    map_service[:latLng][:lat]
  end

  def long
    map_service[:latLng][:lng]
  end
end
