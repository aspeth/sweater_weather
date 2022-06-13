require 'rails_helper'

RSpec.describe 'books facade' do
  it 'returns book poros and a count of books found', :vcr do
    books = BooksFacade.get_books("denver,co", 10)

    book_count = books[1]
    expect(book_count).to be_an(Integer)

    book_poros = books[0]
    expect(book_poros).to be_an(Array)
    expect(book_poros.count).to eq(10)
    expect(book_poros.first).to be_an_instance_of(Book)
    expect(book_poros.last).to be_an_instance_of(Book)
  end
end