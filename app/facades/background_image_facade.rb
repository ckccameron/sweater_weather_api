class BackgroundImageFacade
  def initialize(location)
    @location = location
  end

  def image
    data = {
      location: @location,
      image_url: background_image_service[:photos][0][:url],
      author: background_image_service[:photos][0][:photographer],
      author_portfolio: background_image_service[:photos][0][:photographer_url]
    }

    BackgroundImage.new(data)
  end

  private

  def background_image_service
    BackgroundImageService.new.get_image(@location)
  end
end
