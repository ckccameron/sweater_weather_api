class BackgroundImageService
  def get_image(location)
    to_json("search?query=#{format_city_name(location)}&per_page=1")
  end

  def format_city_name(location)
    location.split(",")[0]
  end

  private

  def conn
    Faraday.new(url: "https://api.pexels.com/v1/") do |req|
      req.headers["Authorization"] = ENV["IMAGE_KEY"]
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
