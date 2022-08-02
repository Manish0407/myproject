module Book
  $books_collection = []
  def books_collection
    print "Enter book id : "
    book_id = gets.to_i
    print "Enter book name : "
    book_name = gets.chomp
    print "Enter book author name : "
    book_author =gets.chomp

    book = { 
      :book_id => book_id,
      :book_name => book_name, 
      :book_author => book_author}
  end
  
  def book_add
    @book = books_collection
    $books_collection.push(@book)
    puts "Book added successfully"
    
  end

  def book_delete
    @book = books_collection
    if $books_collection.include?@book
      $books_collection.each do |each_hash|
        if each_hash.eql?@book
          $books_collection.delete(each_hash)
          puts "Book deleted successfully."
        end
      end
    else
      puts "Book does not exist."  
    end
  end

  def book_collection
    $books_collection.each do |book|
      book.each do |k, v|
        puts "#{k} => #{v}"
      end
      puts
    end     
  end
end