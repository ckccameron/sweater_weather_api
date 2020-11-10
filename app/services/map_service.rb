class MapService
  def get_geocode(location)
    to_json("/geocoding/v1/address?location=#{location}")
  end

  def get_distance_between(origin, destination)
    to_json("directions/v2/route?from=#{origin}&to=#{destination}")
  end

  private

  def conn
    Faraday.new(url: "http://www.mapquestapi.com/") do |req|
      req.params["key"] = ENV["MAPQUEST_KEY"]
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
