require 'rails_helper'

RSpec.describe 'books search' do
  it 'accepts location and quantity, returns weather info for city and books about city', :vcr do
    get "/api/v1/book-search?location=denver,co&quantity=5"

    expect(response).to be_successful
    books_and_weather = JSON.parse(response.body, symbolize_names: true)

    expect(books_and_weather).to have_key(:data)
    expect(books_and_weather[:data]).to be_a(Hash)
    expect(books_and_weather.keys.count).to eq(1)

    data = books_and_weather[:data]

    expect(data).to have_key(:id)
    expect(data[:id]).to be nil
    expect(data).to have_key(:type)
    expect(data[:type]).to eq("books")
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to be_a(Hash)
    expect(data).to have_key(:total_books_found)
    expect(data[:total_books_found]).to be_an(Integer)
    expect(data).to have_key(:books)
    expect(data[:books]).to be_an(Array)
    expect(data.keys.count).to eq(5)

    attributes = data[:attributes]

    expect(attributes).to have_key(:destination)
    expect(attributes[:destination]).to eq("denver,co")
    expect(attributes).to have_key(:forecast)
    expect(attributes[:forecast]).to be_a(Hash)

    books = data[:books]

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

  it "returns an error if location or quantity are missing", :vcr do
    get '/api/v1/book-search?location=denver,co&quantity='

    expect(response.status).to eq(400)
  end

  it "returns an error if location or quantity are missing", :vcr do
    get '/api/v1/book-search?location=&quantity=5'

    expect(response.status).to eq(400)
  end

  it "returns an error if location or quantity are missing", :vcr do
    get '/api/v1/book-search?location=&quantity='

    expect(response.status).to eq(400)
  end

  it "returns an error if given bad location", :vcr do
    get '/api/v1/book-search?location=notalocation&quantity=5'

    expect(response.status).to eq(400)
  end

  it "returns an error if given negative number for quantity", :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=-2'

    expect(response.status).to eq(400)
  end

  it "returns books if given float for quantity", :vcr do
    get '/api/v1/book-search?location=denver,co&quantity=2.5'

    expect(response.status).to eq(200)

    books = JSON.parse(response.body, symbolize_names: true)

    expect(books[:data][:books].count).to eq(2)
  end
end