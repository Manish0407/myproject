module Book_Issue 
  require 'date'
  $issue_details = []
  def Book_Issue.getData
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
    print "Enter borrower adhar no. : "
    @adhar = gets.to_i
    Book_Issue.method1
  end

  def Book_Issue.method1
    borrower = {}

    borrower[@cust_id] = { 
      :book_id => @book_id,
      :book_name => @book_name, 
      :book_author => @book_author, 
      :name => @name, 
      :mobile => @mobile, 
      :adhar => @adhar,
      :time => Time.new}
    $issue_details.push(borrower)
    file = File.open("details.txt","w+");
    file.syswrite("#{$issue_details}");
    file.close();
  end
end