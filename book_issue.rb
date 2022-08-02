module BookIssue 
  $issue_details = []
  $book_request = []
  $manage = []
  def get_data
    print "Enter cust id : "
    @cust_id = gets.to_i
    print "Enter book id : "
    @book_id = gets.to_i
    print "Enter book name : "
    @book_name = gets.chomp
    print "Enter author name : "
    @book_author = gets.chomp
    print "Enter student name : "
    @name = gets.chomp

    student = { 
      :cust_id => @cust_id,
      :book_id => @book_id,
      :book_name => @book_name, 
      :book_author => @book_author, 
      :name => @name}
  end
  def manage_books
    issue = { 
      :book_id => @book_id,
      :book_name => @book_name, 
      :book_author => @book_author}

  end
  def book_issue
    data = get_data
    @issue = manage_books
    $manage.push(@issue)
    if $books_collection.include?@issue
      puts "request sent"
      $book_request.push(data)
    else
      puts "book not available."
    end  

  end
  def issue_request
    #begin
      if $book_request.empty? || $book_request == nil
        #raise NoMethodError.new "No requests yet"
        puts "No requests"
      else
        puts "you have issue request."
        print "Do you want to accept (yes/no) : "
        input = gets.chomp 
        if input == "yes"
          $book_request.each do |request|
            $issue_details.push(request)
          end
          $books_collection.each do |book|
            $manage.each do |data|
              if book.eql?data
                $books_collection.delete(book)
                puts "Book issued successfully."
                $book_request = []
              end
            end
          end
        else
          puts "you cancel the request."  
        end
      end
    #rescue NoMethodError => e 
      #puts e
    #end      
  end

  def details
    $issue_details.each do |each_hash|
      each_hash.each do |k, v|
        puts "#{k} => #{v}"
      end
      puts
    end
  end

  def book_return
    @student = get_data
    @issue = manage_books
    if $issue_details.include?@student
      $books_collection.push(@issue)
      $issue_details.each do |each_hash|
        if each_hash.eql?@student
          $issue_details.delete(each_hash)
          puts "Book returned successfully."
        end
      end
    else
      puts "The information provided by you is not available in our records."
    end
  end
end