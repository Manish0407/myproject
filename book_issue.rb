module BookIssue 
  $issue_details = []
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
    
    #$student = {}

    $student = { 
      :cust_id => @cust_id,
      :book_id => @book_id,
      :book_name => @book_name, 
      :book_author => @book_author, 
      :name => @name}

    return $student
  end
  def manage_books
    #$issue = {}

    $issue = { 
      :book_id => @book_id,
      :book_name => @book_name, 
      :book_author => @book_author}
    return $issue
  end
end