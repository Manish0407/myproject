$LOAD_PATH << '.'
require 'book_issue.rb'
require 'book.rb'
require 'users.rb'
require 'student.rb'
require 'admin.rb'
module Library
  extend Users
  extend Admin
  extend Student
  def self.admin(choice)
    @choice = choice

    case @choice
    when 1                # for create new book.
      self.clear
      Book.book_add  
      self.admin_repeat

    when 2                # for update book quantity.
      self.clear
      Book.update
      self.admin_repeat

   
    when 3                #for show book collection.
      self.clear
      Book.collection
      self.admin_repeat

    when 4                #for delete book quantity.
      self.clear
      Book.delete
      self.admin_repeat  

    when 5                #for issue requests.
      self.clear
      BookIssue.request
      self.admin_repeat    

    when 6                 # for student details.
      self.clear
      BookIssue.details
      self.admin_repeat

    when 7
      self.clear
      users.signup_student
      self.admin_repeat

    when 8
      self.clear
      users.signup_admin    
      self.admin_repeat    

    when 9                 # for logout
      self.logout
    else
      self.clear
      puts "you entered a invailed key please enter a valid key"
      self.admin_choice
    end
  end

  def self.student(choice)
    @choice = choice

    case @choice
    when 1                # for book details.
      self.clear
      Book.collection
      self.student_repeat

    when 2                           #for book issue
      self.clear
      BookIssue.issue
      self.student_repeat

    when 3                           #for return book.
      self.clear
      BookIssue.return
      self.student_repeat

    when 4
      self.logout
    else
      self.clear
      puts "you entered a invailed key please enter a valid key"
      self.student_choice
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
      self.clear
      self.start
    else
      self.clear
      puts "=============================================================================================================================================="
      puts "...............................................................Thank You!................................................................."
      puts "=============================================================================================================================================="
      exit
    end
  end
end
self.clear
puts "=============================================================================================================================================="
puts "......................................Welcome to the shriffle library, Hope you are having a great day!......................................"
puts "=============================================================================================================================================="
Book.new("c","denis",10)
Book.new("computer science","klp",10)
Book.new("data science","AD",10)
Book.new("ruby","K",10)
Book.new("python","Rosam",10)
users.first