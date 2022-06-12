class BackgroundSerializer
  def self.image(image_info)
    {
      "data": {
        type: "image",
        id: nil,
        attributes: {
          location: image_info.location,
          image_url: image_info.image_url,
          credit: {
            source: image_info.source,
            user: image_info.user,
            user_url: image_info.user_url,
          }
        }
      }
    }
  end
end