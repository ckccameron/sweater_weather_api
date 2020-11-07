class MapFacade
  def self.lat_long(location)
    service.get_geocode(location)[:results][0][:locations][0][:latLng]
  end

  def self.service
    MapService.new
  end
end
