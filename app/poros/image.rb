class Image
  attr_reader :id,
              :location,
              :image_url,
              :source,
              :user,
              :user_url

  def initialize(data)
    @id = nil
    @location = data[:user][:location].to_s
    @image_url = data[:urls][:raw]
    @source = "unsplash.com"
    @user = data[:user][:username]
    @user_url = data[:user][:links][:html]
  end
end