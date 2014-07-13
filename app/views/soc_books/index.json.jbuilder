json.array!(@soc_books) do |soc_book|
  json.extract! soc_book, :id, user_id, :soc_book_id
  json.url soc_book_url(soc_book, format: :json)
end
