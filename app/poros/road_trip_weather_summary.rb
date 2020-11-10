class RoadTripWeatherSummary
  attr_reader :temperature,
              :conditions

  def initialize(data)
    @temperature = data[:temp]
    @conditions = data[:weather][0][:description]
  end
end
