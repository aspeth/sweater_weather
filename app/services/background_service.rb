class BackgroundService
  def self.get_image(location)
    conn = Faraday.new("https://api.unsplash.com/")
    response = conn.get("search/photos?query=#{location}&client_id=#{ENV["unsplash_api_key"]}")
    JSON.parse(response.body, symbolize_names: true)
  end
end