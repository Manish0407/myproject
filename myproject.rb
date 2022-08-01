$LOAD_PATH << '.'
require 'all_methods.rb'
require 'login.rb'
require 'student.rb'
require 'choice.rb'

class Library
  extend AllMethods
  extend Login
  extend Admin
  extend Student
  def Library.admin(choice)
    @choice = choice

    case @choice
    when 1                # for book details.
      Library.book_collection  
      Login.admin_repeat

    when 2                # for book issue.
      Library.issue_request
      Login.admin_repeat

   
    when 3                #for book delete.
      Library.book_delete
      Login.admin_repeat

    when 4                #for add new book.
      Library.book_add
      Login.admin_repeat  

    when 5                 # for student details.
      Library.student_details
      Login.admin_repeat

    when 6                 # for logout
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
    when 1                # for book details.
     
      Library.book_collection 
      Library.student_repeat

    when 2                           #for book issue
      
      Library.book_issue
      Library.student_repeat

    when 3                           #for return book.
      
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
      Library.student_choice
    end
  end
end
puts "=============================================================================================================================================="
puts "......................................Welcome to the shriffle library, Hope you are having a great day!......................................"
puts "=============================================================================================================================================="

Library.user