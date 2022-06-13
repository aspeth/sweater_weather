require 'rails_helper'

RSpec.describe 'Books Service' do
  it 'gets book information', :vcr do
    response = BooksService.get_books("denver,co")

    expect(response).to be_a(Hash)
    expect(response).to have_key(:numFound)
    expect(response[:numFound]).to be_an(Integer)
    expect(response).to have_key(:docs)
    expect(response[:docs]).to be_an(Array)
  end
end