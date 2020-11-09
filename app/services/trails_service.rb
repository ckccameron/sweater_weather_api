class TrailsService
  def get_trails(lat, long)
    to_json("data/get-trails?lat=#{lat}&lon=#{long}")
  end

  private

  def conn
    Faraday.new(url: "https://www.hikingproject.com/") do |req|
      req.params["key"] = ENV["TRAIL_KEY"]
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
