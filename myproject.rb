$LOAD_PATH << '.'
require 'book_issue.rb'
require 'borrower_details.rb'
require 'book_add.rb'
require 'choice.rb'
class Library
  def Library.library(choice)
    @@choice = choice

    case @@choice
    when 1
      Book_Issue.getData
      Choice.repeat
    when 2
      Book_Issue.book_return
      Choice.repeat

    when 3
      Book_Add.add
      Choice.repeat

    when 4
      $books_collection.each do |key, value|
        puts "#{key}  #{value}"
      end

      Choice.repeat

    when 5

      Borrower_Details.details
      
      Choice.repeat

    when 6
      puts "thanks for visiting have a nice day."
      File.truncate("details.txt", 0)
      exit

    else
      puts "you entered a invailed key please enter a valid key"
      Choice.user
    end
    
  end
end
puts "=============================================================================================================================================="
puts "......................................Welcome to the shriffle library, Hope you are having a great day!......................................"
puts "=============================================================================================================================================="
obj = Library.new
Choice.user