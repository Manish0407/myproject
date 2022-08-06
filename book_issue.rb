require 'book.rb'
require 'users.rb'
require 'student.rb'
require 'admin.rb'
class BookIssue 

  Issue_details = []
  attr_accessor :s_id, :name, :book_name, :status

  def initialize(s_id,name,book_name,status)
      @s_id = s_id
      @name = name
      @book_name = book_name
      @status = status
      Issue_details << self
  end

  class << self

    def issue_status
      count = 0
      Issue_details.select do |i|
        if i.name == Users.name
          puts "Name = #{i.name}\n Book = #{i.book_name}\n Status = #{i.status}"
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
        puts "Enter id for change the status."
        id = gets.to_i
        puts "Book name : "
        b_name = gets.chomp
        if BookIssue.find_id(id) == true
          Issue_details.find do |r|
            if id == r.s_id
              if b_name == r.book_name
                puts "allot / cancel / or any key for back"
                status = gets.chomp
                if status == "allot"
                  r.status = status
                  Book::Books.find do |book|
                    if book.name == b_name
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
              end 
            end
          end
        else
          puts "Invalid ID" 
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

    def find_id(id)
      Issue_details.find do |r|
        if r.s_id == id
          return true
        end
      end  
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
        puts "Enter book name : "
        b_name = gets.chomp
        if BookIssue.find_id(id) == true
          Issue_details.find do |r|
            if id == r.s_id
              if b_name == r.book_name
                puts "deposit / cancel / or any key for back"
                status = gets.chomp
                if status == "deposit"
                  r.status = status
                  Book::Books.find do |book|
                    if book.name == b_name
                      book.qty += 1
                      puts "Book deposit successfully."
                      if BookIssue.return_status == true
                        puts "Do you want to see remaining pending request (y/n)"
                        input = gets.chomp
                        if input == "y"
                          BookIssue.check_return
                        else
                          Admin.admin_choice
                        end 
                      else
                        break   
                      end  
                    end
                  end
                elsif status == "cancel"
                  r.status = "allot"
                  puts "you cancel the request."  
                else
                  Admin.admin_choice  
                end
              end   
            end
          end
        else
          puts "Invalid ID" 
        end    
      else
        puts "No book return request......."  
      end        
    end  

    def return_status
      Issue_details.find do |i|
        if i.status == "return"
          return true
        end
      end  
    end  

    def find_by_book(return_book_name)
      Issue_details.find { |user|
        if user.s_id.eql? Users.s_id
          if user.book_name == return_book_name
            return true
          end
        end
      }
    end

    def return
      print "Enter book name you want to return :"
      return_book_name = gets.chomp
      if BookIssue.find_by_book(return_book_name) == true
        Issue_details.find { |user|
          if user.s_id.eql? Users.s_id
            if user.book_name == return_book_name
              if user.status == "allot"
                user.status = "return"
                puts "Book returned request sent to admin!"
              else
                puts "Please check book status"
              end          
            end
          end
        }
      else
        puts "this book is not alloted to you"  
      end
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
                    BookIssue.new(user.s_id,user.name,book_name,"Pending") 
                    puts "book request sent to admin!" 
                    break
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
