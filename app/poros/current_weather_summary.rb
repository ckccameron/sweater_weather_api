class CurrentWeatherSummary
  attr_reader :summary,
              :temperature

  def initialize(data)
    @summary = data[:summary]
    @temperature = data[:temperature]
  end
end
