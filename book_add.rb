module BookAdd
  $books_collection = []
  def books_collection
    print "Enter book id : "
    @book_id = gets.to_i
    print "Enter book name : "
    @book_name = gets.chomp
    print "Enter book author name : "
    @book_author =gets.chomp
    $book = {}

    $book = { 
      :book_id => @book_id,
      :book_name => @book_name, 
      :book_author => @book_author}
    return $book
  end
end