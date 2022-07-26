module Book_Issue 
  require 'date'
  @@borrower = {}
  def Book_Issue.getData(book_id,book_name,book_author,name,mobile,adhar)
    @book_id = book_id
    @book_name = book_name
    @book_author = book_author
    @name = name
    @mobile = mobile
    @adhar = adhar
    Book_Issue.method1
  end
  def Book_Issue.method1
    @@borrower[@book_id] = { 
      :book_name => @book_name, 
      :book_author => @book_author, 
      :name => @name, 
      :mobile => @mobile, 
      :adhar => @adhar,
      :time => Time.new}
    file = File.open("sample.txt","w+");
    file.syswrite("#{@@borrower}");
    file.close();
  end

  def Book_Issue.choice
    print "Do you want to show borrower details (yes/no) : "
    input = gets.chomp
    if input == "yes"
      Book_Issue.show_Details
    else
      exit
    end
  end

  def Book_Issue.show_Details
    puts "Borrower_Details = #{@@borrower}"
  end

end

# book_id = 1000
# for i in 1..3
#   book_id += 1
#   print "Enter borrower name : "
#   book_name = gets.chomp
#   print "Enter borrower name : "
#   book_author = gets.chomp
#   print "Enter borrower name : "
#   name = gets.chomp
#   print "Enter borrower mobile no. : "
#   mobile = gets.to_i
#   print "Enter borrower adhar no. : "
#   adhar = gets.to_i
#   i = Borrower_Details.new
#   i.getData(id,name,mobile,adhar)
# end
# Borrower_Details.new.choice