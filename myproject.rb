$LOAD_PATH << '.'
require 'book_issue.rb'
require 'student_details.rb'
require 'book_add.rb'
require 'login.rb'
require 'book_details.rb'

class Library
  extend Login
  extend Admin
  extend Student
  extend BookIssue
  extend BookDetails
  extend BookAdd
  extend StudentDetails
  def Library.admin(choice)
    @choice = choice

    case @choice
    when 1
      Library.get_data
      Library.admin_repeat
    when 2
      print "enter book id :"
      id = gets.chomp
      $hash.delete(id)
      Library.admin_repeat 

    when 3
      Library.book_add
      Library.admin_repeat

    when 4
      Library.books
      Library.admin_repeat

    when 5

      Library.details
      
      Library.admin_repeat

    when 6
      puts "......................Logout........................"
      print "do you want to continue (yes/no) : "
      input = gets.chomp
      if input == "yes"
        Library.user
      else
        exit
      end
    else
      puts "you entered a invailed key please enter a valid key"
      Library.admin_choice
    end
  end

  def Library.student(choice)
    @choice = choice

    case @choice
    when 1
      File.foreach("book_details.txt") do |read| 
       puts read
      end
      Library.student_repeat

    when 2
      Library.get_data
      Library.student_repeat

    when 3
      Library.book_return
      Library.student_repeat

    when 4
      puts "......................Logout........................"
      print "do you want to continue (yes/no) : "
      input = gets.chomp
      if input == "yes"
        Library.user
      else
        exit
      end
    else
      puts "you entered a invailed key please enter a valid key"
      Library.admin_choice
    end
  end
end
puts "=============================================================================================================================================="
puts "......................................Welcome to the shriffle library, Hope you are having a great day!......................................"
puts "=============================================================================================================================================="

Library.user