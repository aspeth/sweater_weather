class MapquestFacade
  def self.get_lat_long(location)
    MapquestService.get_lat_long(location)
  end

  def self.get_directions(origin, destination)
    MapquestService.get_directions(origin, destination)
  end
end