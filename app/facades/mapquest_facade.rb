class MapquestFacade
  def self.get_lat_long(location)
    MapquestService.get_lat_long(location)
  end
end