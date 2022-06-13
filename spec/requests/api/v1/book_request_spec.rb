require 'rails_helper'

RSpec.describe 'books search' do
  it 'accepts location and quantity, returns weather info for city and books about city' do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    expect(response).to have_key(:data)
    expect(response[:data]).to be_a(Hash)
    expect(response.keys.count).to eq(1)

    data = response[:data]

    expect(data).to have_key(:id)
    expect(data[:id]).to be nil
    expect(data).to have_key(:type)
    expect(data[:type]).to eq("books")
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    expect(data.keys.count).to eq(3)

    attributes = data[:attributes]

    expect(attributes).to have_key(:destination)
    expect(attributes[:destination]).to eq("denver,co")
    expect(attributes).to have_key(:forecast)
    expect(attributes[:forecast]).to be_a(Hash)
    expect(attributes).to have_key(:total_books_found)
    expect(attributes[:total_books_found]).to be_an(Integer)
    expect(attributes).to have_key(:books)
    expect(attributes[:books]).to be_an(Array)

    books = attributes[:books]

    expect(books.count).to eq(5)
    books.each do |book|
      expect(book).to be_a(Hash)
      expect(book).to have_key(:isbn)
      expect(book[:isbn]).to be_an(Array)
      expect(book).to have_key(:title)
      expect(book[:title]).to be_a(String)
      expect(book).to have_key(:publisher)
      expect(book[:publisher]).to be_an(Array)
    end
  end
end