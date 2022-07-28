module Book_Add
  $books_collection = []
  def Book_Add.add
    print "Enter book id : "
    @book_id = gets.to_i
    print "Enter book name : "
    @book_name = gets.chomp
    print "Enter book author name : "
    @book_author =gets.chomp
    print "Enter book year : "
    @book_year = gets.to_i
    Book_Add.push
  end
  def Book_Add.push
    book = {}

    book[@book_id] = { 
      :book_name => @book_name, 
      :book_author => @book_author, 
      :name => @name, 
      :book_year => @book_year}
    $books_collection.push(book)
    file = File.open("details.txt","w+");
    file.syswrite("#{$books_collection}");
    file.close();
    puts ".................................thank you......................................"
  end
end