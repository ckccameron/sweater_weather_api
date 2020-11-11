class RoadTrip
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :weather_at_eta

  def initialize(data)
    @origin = data[:origin]
    @destination = data[:destination]
    @travel_time_unformatted = data[:travel_time_string]
    @travel_time = format_travel_time
    @weather_at_eta = data[:forecast_at_eta]
  end

  def format_travel_time
    time = @travel_time_unformatted.split(/:/)

    "#{time[0]} hr, #{time[1]} min"
  end
end
