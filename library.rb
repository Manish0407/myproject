$LOAD_PATH << '.'
require 'book_issue.rb'
require 'manage_books.rb'
require 'manage_users.rb'
require 'student.rb'
require 'admin.rb'
module Library
  extend Users
  extend Admin
  extend Student
  extend BookIssue
  extend Book
  def Library.admin(choice)
    @choice = choice

    case @choice
    when 1                # for book details.
      Library.book_add  
      Library.admin_repeat

    when 2                # for book issue.
      Library.issue_request
      Library.admin_repeat

   
    when 3                #for book delete.
      Library.book_delete
      Library.admin_repeat

    when 4                #for add new book.
      Library.book_collection
      Library.admin_repeat  

    when 5                 # for student details.
      Library.details
      Library.admin_repeat

    when 6
      Library.signup_student
      Library.admin_repeat

    when 7
      Library.signup_admin    
      Library.admin_repeat    

    when 8                 # for logout
      Library.logout
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
      Library.logout
    else
      puts "you entered a invailed key please enter a valid key"
      Library.student_choice
    end
  end

  def Library.logout
    puts "......................Logout........................"
      print "do you want to continue (yes/no) : "
      input = gets.chomp
      if input == "yes"
        Library.start
      else
        exit
      end
  end
end
puts "=============================================================================================================================================="
puts "......................................Welcome to the shriffle library, Hope you are having a great day!......................................"
puts "=============================================================================================================================================="

Library.first