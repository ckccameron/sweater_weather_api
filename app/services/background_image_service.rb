class BackgroundImageService
  def get_image(location)
    binding.pry
    to_json("search/photos") do |req|
      req.params["query"] = format_city_name(location)
      req.params["per_page"] = 1
      req.params["orientation"] = "landscape"
    end
  end

  def format_city_name(location)
    location.split(",")[0]
  end

  private

  def conn
    Faraday.new(url: "https://api.unsplash.com/") do |req|
      req.headers["Accept-Version"] = "v1"
      req.params["client_id"] = ENV["IMAGE_KEY"]
    end
  end

  def to_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
