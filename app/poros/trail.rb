class Trail
  attr_reader :id,
              :name,
              :summary,
              :difficulty,
              :location,
              :latitude,
              :longitude,
              :distance_to_trail

  def initialize(trail_data, location)
    @name = trail_data[:name]
    @summary = trail_data[:summary]
    @difficulty = trail_data[:difficulty]
    @location = trail_data[:location]
    @latitude = trail_data[:latitude]
    @longitude = trail_data[:longitude]
    @distance_to_trail = map_service_distance_between
  end

  def map_service_distance_between
    MapService.new.get_distance_between(@location, @latitude, @longitude)[:route][:distance].to_s
  end
end
