class BooksService
  def self.get_books(location)
    conn = Faraday.new("http://openlibrary.org/")
    response = conn.get("search.json?q=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end
end