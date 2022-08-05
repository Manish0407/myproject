require 'book.rb'
require 'users.rb'
require 'student.rb'
require 'admin.rb'
class BookIssue 

  Issue_details = []
  attr_accessor :s_id, :name, :book_name, :status

  def initialize(name,book_name,status)
    @s_id = set_incremental_id
    @name = name
    @book_name = book_name
    @status = status
    Issue_details << self
  end

  def set_incremental_id
    (Issue_details.last&.s_id || 0) + 1
  end

  class << self

    def issue_status
      count = 0
      Issue_details.select do |i|
        if i.name == Users.name
          puts "Name = #{i.name}\n Book = #{i.book_name}\n Status = #{i.status}"
          break
        end
      end   
    end

    def request
      if BookIssue.pending_requests == true
        Issue_details.find do |i|
          if i.status == "Pending"
            puts "id = #{i.s_id}\n name = #{i.name} \n book_name = #{i.book_name} \n status = #{i.status}"
            puts
          end
        end  
        puts "Enter id whose you want to allot."
        id = gets.to_i
        Issue_details.select do |r|
          if id == r.s_id
            puts "allot / cancel / or any key for back"
            status = gets.chomp
            if status == "allot"
              r.status = status
              Book::Books.find do |book|
                if book.name == r.book_name
                  book.qty -= 1
                  puts "Book issued successfully."
                  if BookIssue.pending_requests == true
                    puts "Do you want to see remaining pending request (y/n)"
                    input = gets.chomp
                    if input == "y"
                      BookIssue.request
                    else
                      Admin.admin_choice
                    end  
                  end  
                end
              end
            elsif status == "cancel"
              r.status == status
              r.book_name = "nil"
              puts "you cancel the request."  
            else
              Admin.admin_choice  
            end
          else
            puts "Invalid ID"  
          end
        end
      else
        puts "No book request......."  
      end        
    end  

    def pending_requests
      Issue_details.find do |i|
        if i.status == "Pending"
          return true
        end
      end     
    end  

    def details
      Issue_details.select do |i|
        puts "Name = #{i.name}\n Book = #{i.book_name}\n Status = #{i.status}"
      end   
    end

    def search(book_name)
      Book::Books.select { |book| 
       if book.name == book_name
        return true
       end 
      }.first
    end 

    def find_by(name)
      Issue_details.select { |item| item.book_name == book_name }.first
    end

    def check_return
      if BookIssue.return_status == true
        Issue_details.find do |i|
          if i.status == "return"
            puts "id = #{i.s_id}\n name = #{i.name} \n book_name = #{i.book_name} \n status = #{i.status}"
            puts
          end
        end  
        puts "Enter id which status do you want to change."
        id = gets.to_i
        Issue_details.find do |r|
          if id == r.s_id
            puts "diposit / cancel / or any key for back"
            status = gets.chomp
            if status == "diposit"
              r.status = status
              Book::Books.find do |book|
                if book.name == r.book_name
                  book.qty += 1
                  puts "Book diposit successfully."
                  if BookIssue.return_status == true
                    puts "Do you want to see remaining pending request (y/n)"
                    input = gets.chomp
                    if input == "y"
                      BookIssue.check_return
                    else
                      Admin.admin_choice
                    end  
                  end  
                end
              end
            elsif status == "cancel"
              r.status = "allot"
              puts "you cancel the request."  
            else
              Admin.admin_choice  
            end
          else
            puts "Invalid ID"  
          end
        end
      else
        puts "No book request......."  
      end        
    end  

    def return_status
      Issue_details.find do |i|
        if i.status == "return"
          return true
        end
      end  
    end  

    def return
      print "Enter book name you want to return :"
      return_book_name = gets.chomp
      Issue_details.find { |user|
        if user.s_id.eql? Users.s_id
          if user.book_name == return_book_name
            if user.status == "allot"
              user.status = "return"
              puts "Book returned request sent to admin!"
            else
              puts "Please check book status"
            end        
          else
            puts "this book is not alloted to you"  
          end
        end
      }
    end

    def issue
      count = 0
      print "Enter book name : "
      book_name = gets.chomp
      if BookIssue.search(book_name) == true
        Book::Books.find do |book|
          if book.name == book_name
            if book.qty >= 1
              Issue_details.find { |user|
              if user.s_id.eql? Users.s_id
                if user.book_name == "nil" || user.book_name == "cancel"
                  user.status = "Pending"
                  user.book_name = book_name
                  puts "book request sent to admin!"
                else
                  puts "you can not request for book first check your status."  
                end
              end
              }
            else
              puts "insuficient quantity"
            end
          end
        end
      else
        puts "book not available."  
      end
    end

  end
end
