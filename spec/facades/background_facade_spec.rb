require 'rails_helper'

RSpec.describe 'Background Facade' do
  it 'returns an image object' do
    image_info = BackgroundFacade.get_image("denver,co")

    expect(image_info).to be_an_instance_of(Image)
  end
end