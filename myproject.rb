$LOAD_PATH << '.'
require 'book_issue.rb'
require 'borrower_details.rb'
class Library
  def library
    puts "Press 1. for issue book"
    puts "Press 2. for return book"
    puts "Press 3. for add a book"
    puts "Press 4. for book details"
    puts "Press 5 for borrower details"
    puts "press 6. for exit"
    @@choice = gets.to_i

    case @@choice
    when 1
      Book_Issue.getData

      puts "Do you want to continue (yes/no) :"
      input = gets.chomp

      if input == "yes"
        puts "Welcome again"
        library

      else
        File.truncate("details.txt", 0)
        exit

      end
    when 2
      puts "Enter your cust id : "
      cust_id = gets.to_i
      puts "Enter book id :"
      @book_id = gets.to_i
      $issue_details.tap {|i| i.delete(cust_id)}
      puts "Book successfuly returned"
      puts "Do you want to continue (yes/no) :"
      input = gets.chomp
      if input == "yes"
        puts "Welcome again"
        library

      else
        File.truncate("details.txt", 0)
        exit

      end
    when 3

    when 4
      File.foreach("book_details.txt") { |read| puts read}
      puts "Do you want to continue (yes/no) :"
      input = gets.chomp
      if input == "yes"
        puts "Welcome again"
        library

      else
        File.truncate("details.txt", 0)
        exit

      end

    when 5
      Borrower_Details.details
      puts "Do you want to continue (yes/no) :"
      input = gets.chomp
      if input == "yes"
        puts "Welcome again"
        library

      else
        File.truncate("details.txt", 0)
        exit

      end
    when 6
      puts "thanks for visiting have a nice day"
      File.truncate("details.txt", 0)
      exit
    else
      puts "you entered a invailed key please enter a valid key"
      library
    end
    
  end
end
puts "welcome to the shriffle library, Hope you are having a great day!"
obj = Library.new
obj.library