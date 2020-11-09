class BackgroundImage
  attr_reader :location,
              :image_url,
              :credit

  def initialize(data)
    @location = data[:location]
    @image_url = data[:image_url]
    @credit = {
      source: "https://www.pexels.com",
      author: data[:author],
      author_portfolio: data[:author_portfolio],
      logo: "https://images.pexels.com/lib/api/pexels.png"
    }
  end
end
