$LOAD_PATH << '.'
require 'book_issue.rb'
require 'book.rb'
require 'users.rb'
require 'student.rb'
require 'admin.rb'
module Library
  #extend Users
  extend Admin
  extend Student
  def self.admin(choice)
    @choice = choice

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

    when 5                #for issue requests.
      Library.clear
      BookIssue.request
      Admin.admin_choice    

    when 6                 # for student details.
      Library.clear
      BookIssue.details
      Admin.admin_choice

    when 7
      Library.clear
      users.signup_student
      Admin.admin_choice

    when 8
      Library.clear
      users.signup_admin    
      Admin.admin_choice    

    when 9                 # for logout
      Library.logout
    else
      Library.clear
      puts "you entered a invailed key please enter a valid key"
      Admin.admin_choice
    end
  end

  def self.student(choice)
    @choice = choice

    case @choice
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
      BookIssue.allotment  
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
Book.new("c","denis",10)
Book.new("computer science","klp",10)
Book.new("data science","AD",10)
Book.new("ruby","K",10)
Book.new("python","Rosam",10)

BookIssue.new("manish",nil,0)
BookIssue.new("pratik",nil,0)
BookIssue.new("shashank",nil,0)
BookIssue.new("urvashi",nil,0)

Users.new("manish","manish04")
Users.new("pratik","pratik12")
Users.new("shashank","sha12")
Users.new("urvashi","urvashi12")
Users.first