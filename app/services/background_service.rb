class BackgroundService < BaseService
  def self.get_image(location)
    response = conn("https://api.unsplash.com/").get("search/photos?query=#{location}&client_id=#{ENV["unsplash_api_key"]}")
    get_json(response)
  end
end