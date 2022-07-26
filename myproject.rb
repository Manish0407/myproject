$LOAD_PATH << '.'
require 'book_issue.rb'
require 'borrower_details.rb'
class Library
  def library(book_id)
    puts "Press 1. for issue book"
    puts "Press 2. for return book"
    puts "Press 3. for add a book"
    puts "Press 4. for book details"
    puts "Press 5 for borrower details"
    puts "press 6. for exit"
    @@choice = gets.to_i
    case @@choice
    when 1
      book_id += 1
      print "Enter book name : "
      book_name = gets.chomp
      print "Enter author name : "
      book_author = gets.chomp
      print "Enter borrower name : "
      name = gets.chomp
      print "Enter borrower mobile no. : "
      mobile = gets.to_i
      print "Enter borrower adhar no. : "
      adhar = gets.to_i
      Book_Issue.getData(book_id,book_name,book_author,name,mobile,adhar)
      library(book_id)
    when 2


    when 3

    when 4

    when 5
      Borrower_Details.details
      library(book_id)
    end
    
  end
end
puts "welcome to the shriffle library"
obj = Library.new
obj.library(1000)