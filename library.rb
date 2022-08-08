$LOAD_PATH << '.'
require 'book_issue.rb'
require 'book.rb'
require 'users.rb'
require 'student.rb'
require 'admin.rb'
require 'seed.rb'
module Library
  extend Admin
  extend Student
  def self.admin(choice)
    @choice = choice

    Library.clear
    case @choice
    when 1                # for create new book.
      Library.clear
      Book.book_add  
      Admin.admin_choice

    when 2                # for update book quantity.
      Library.clear
      Book.update
      Admin.admin_choice

   
    when 3                #for show book collection.
      Library.clear
      Book.collection
      Admin.admin_choice

    when 4                #for delete book quantity.
      Library.clear
      Book.delete
      Admin.admin_choice  

    when 5
      Library.clear
      BookIssue.request 
      Admin.admin_choice
      
    when 6                #for issue requests.
      Library.clear
      BookIssue.check_return 
      Admin.admin_choice    

    when 7                 # for student details.
      BookIssue.details
      Admin.admin_choice

    when 8
      Library.clear
      Users.signup_student
      Admin.admin_choice

    when 9
      Library.clear
      Users.signup_admin    
      Admin.admin_choice    

    when 10                 # for logout
      Library.logout
    else
      Library.clear
      puts "you entered a invailed key please enter a valid key"
      Admin.admin_choice
    end
  end

  def self.student(choice)

    case choice
      when 1                # for book details.
        Library.clear
        Book.collection
        Student.student_choice

      when 2                           #for book issue
        Library.clear
        BookIssue.issue
        Student.student_choice

      when 3                           #for return book.
        Library.clear
        BookIssue.return
        Student.student_choice

      when 4
        BookIssue.issue_status  
        Student.student_choice

      when 5
        Library.logout
      else
        Library.clear
        puts "you entered a invailed key please enter a valid key"
        Student.student_choice
    end

  end

  def self.clear
    print "\e[2J\e[f"
  end

  def self.logout
    puts "......................Logout........................"
    puts "do you want to continue (yes/y), "
    print "or any key for exit : "
    input = gets.chomp
    if input == "yes" || input == "y"
      Library.clear
      Users.start
    else
      Library.clear
      puts "=============================================================================================================================================="
      puts "...............................................................Thank You!................................................................."
      puts "=============================================================================================================================================="
      exit
    end
  end
end
Library.clear
puts "=============================================================================================================================================="
puts "......................................Welcome to the shriffle library, Hope you are having a great day!......................................"
puts "=============================================================================================================================================="
Seed.seeds
Users.first