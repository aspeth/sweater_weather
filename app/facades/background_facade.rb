class BackgroundFacade
  def self.get_image(location)
    image_info = BackgroundService.get_image(location)
    Image.new(image_info[:results].sample)
  end
end