class WeatherService
  def get_weather(lat, lon)
    to_json("data/2.5/onecall?lat=#{lat}&lon=#{lon}")
  end

  private

  def conn
    Faraday.new(url: "https://api.openweathermap.org/") do |req|
      req.params["appid"] = ENV["WEATHER_KEY"]
      req.params["exclude"] = "minutely"
      req.params["units"] = "imperial"
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
