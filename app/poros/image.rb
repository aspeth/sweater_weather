class Image
  def initialize(data)
    @id = nil
    @location = data[:user][:location]
    @image_url = data[:urls][:raw]
    @source = "unsplash.com"
    @user = data[:user][:username]
    @user_url = data[:user][:links][:html]
  end
end