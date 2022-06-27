require 'rails_helper'

RSpec.describe Image do
  it 'exists and has attributes' do
    response = BackgroundService.get_image("denver,co")

    image = Image.new(response[:results].sample)

    expect(image).to be_an_instance_of(Image)
    expect(image.id).to be nil
    expect(image.location).to be_a(String)
    expect(image.image_url).to be_a(String)
    expect(image.source).to be_a(String)
    expect(image.user).to be_a(String)
    expect(image.user_url).to be_a(String)
  end
end