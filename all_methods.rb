$LOAD_PATH << '.'
require 'book_issue.rb'
require 'student_details.rb'
require 'book_add.rb'
require 'login.rb'
require 'student.rb'
require 'choice.rb'
module AllMethods
  extend Login
  extend Admin
  extend Student
  extend BookIssue
  extend BookAdd
  extend StudentDetails
  def book_collection
    $books_collection.each do |book|
      book.each do |k, v|
        puts "#{k} => #{v}"
      end
      puts
    end     
  end

  def book_issue
    $student = AllMethods.get_data
    $issue = AllMethods.manage_books
    if $books_collection.include?$issue
      puts "request sent"
    else
      puts "book not available."
    end  

  end
  def issue_request
    if $student.empty?
      puts "No requests"
    else
      puts "you have issue request."
      print "Do you want to accept (yes/no) : "
      input = gets.chomp 
      if input == "yes"
        $issue_details.push($student)
        $books_collection.each do |book|
          if book.eql?$issue
            $books_collection.delete(book)
            puts "Book issued successfully."
          end
        end
      else
        puts "you cancel the request."  
      end
    end
  end

  def book_delete
    $book = AllMethods.books_collection
    if $books_collection.include?$book
      $books_collection.each do |each_hash|
        if each_hash.eql?$book
          $books_collection.delete(each_hash)
          puts "Book deleted successfully."
        end
      end
    else
      puts "Book does not exist."  
    end
  end

  def book_add
    $book = AllMethods.books_collection
    $books_collection.push($book)
    puts "Book added successfully"
    
  end

  def student_details
    AllMethods.details
  end

  def book_return
    $student = AllMethods.get_data
    $issue = AllMethods.manage_books
    if $issue_details.include?$student
      $books_collection.push($issue)
      $issue_details.each do |each_hash|
        if each_hash.eql?$student
          $issue_details.delete(each_hash)
          puts "Book returned successfully."
        end
      end
    else
      puts "The information provided by you is not available in our records."
    end
  end
end