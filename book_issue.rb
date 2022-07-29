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
    print "Enter borrower name : "
    @name = gets.chomp
    print "Enter borrower mobile no. : "
    @mobile = gets.to_i
    method1
  end

  def method1
    borrower = {}

    borrower[@cust_id] = { 
      :book_id => @book_id,
      :book_name => @book_name, 
      :book_author => @book_author, 
      :name => @name, 
      :mobile => @mobile}
    $issue_details.push(borrower)
  end

  def book_return
    puts "Enter your cust id : "
    @cust_id = gets
    puts "Enter book id :"
    @book_id = gets.to_i
    File.truncate("details.txt", 0)
    $issue_details.each do |each_hash|
      each_hash.each do |each_hash_element|
        each_hash_element.each do |k,v|
          k.delete(@cust_id)
        end
      end
    end
  
    puts "Book successfuly returned"
  end
end