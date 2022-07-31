$LOAD_PATH << '.'
require 'book_issue.rb'
require 'student_details.rb'
require 'book_add.rb'
require 'login.rb'

class Library
  extend Login
  extend Admin
  extend Student
  extend BookIssue
  extend BookAdd
  extend StudentDetails
  def Library.admin(choice)
    @choice = choice

    case @choice
    when 1                # for book details.
      $books_collection.each do |hash|
        hash.each do |k, v|
          puts "#{k} => #{v}"
        end
        puts
      end     
      Login.admin_repeat

    when 2                # for book issue.
      $student = Library.get_data
      $issue_details.push($student)
      Login.admin_repeat

    when 3                # for book return.
      $student = Library.get_data
      $issue_details.each do |each_hash|
        if each_hash.eql?$student
          $issue_details.delete(each_hash)
        end
      end
      Login.admin_repeat

    when 4                #for book delete.
      $book = Library.books_collection
      $books_collection.each do |each_hash|
        if each_hash.eql?$book
          $books_collection.delete(each_hash)
        end
      end
      Login.admin_repeat

    when 5                #for add new book.
      $book = Library.books_collection
      $books_collection.push($book)
      $books_collection.each do |k,v|
        puts "#{k}  #{v}"
      end
      puts
      Login.admin_repeat  

    when 6                 # for student details.
      Library.details
      Login.admin_repeat

    when 7                 # for logout
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
      $books_collection.each do |hash|
        hash.each do |k, v|
          puts "#{k} => #{v}"
        end
        puts
      end   
      Library.student_repeat

    when 2
      $student = Library.get_data
      $issue_details.push($student)
      Library.student_repeat

    when 3
      $student = Library.get_data
      $issue_details.each do |each_hash|
        if each_hash.eql?$student
          $issue_details.delete(each_hash)
        end
      end
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