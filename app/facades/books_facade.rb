class BooksFacade
  def self.get_books(location, quantity)
    books = BooksService.get_books(location)

    book_count = books[:numFound]

    book_poros = []

    books[:docs].first(quantity.to_i).map do |book|
      book_poros << Book.new(book)
    end

    return book_poros, book_count
  end
end