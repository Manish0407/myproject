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
          puts "student name = #{i.name} \nbook name = #{i.book_name}\n status = #{i.status}"
          break
        else
          count +=1
          if count == 1
            puts "No books issued yet!"
          end
        end
      end   
    end
    def request
      Issue_details.find do |i|
        i.status == "pending"
        puts "id = #{i.s_id}\n name = #{i.name} \n book_name = #{i.book_name} \n quantity = #{i.status}"
      end  
      puts
      puts "Enter id whose you want to allot."
      id = gets.to_i
      Issue_details.find do |r|
        if id == r.s_id
          puts "allot / cancel"
          status = gets.chomp
          r.status = status
          if r.status == "allot"
            Book::Books.find do |book|
              if book.name == r.book_name
                book.qty -= 1
                puts "Book issued successfully."  
                  
              end
            end
          elsif r.status == "cancel"
            puts "you cancel the request."  
          else
            puts "you done #{r.status}"  
          end
        end
      end
    end  
    def details
      Issue_details.select do |i|
        puts "student name = #{i.name} \nbook_name = #{i.book_name}\n quantity = #{i.status}"
      end   
    end
    def search(book_name)
      Book::Books.select { |book| book.name == book_name }.first
    end 
    def find_by(name)
      Issue_details.select { |item| item.book_name == book_name }.first
    end
    def return
      print "Enter book name you want to return :"
      return_book_name = gets.chomp
      unless BookIssue.find_by(return_book_name).nil?
        Issue_details.select do |i|
          if i.book_name == return_book_name
            if Users.name == i.name
              i.status = "deposit"
              i.book_name.clear
            end
            Book::Books.find do |book|
              if book.name == return_book_name
                book.qty += 1
              end
            end
            puts "Book return successfully"
            break
          end
        end
      else
        puts "The information provided by you is not available in our records."  
      end    
    end
    def issue
      count = 0
      print "Enter book name : "
      book_name = gets.chomp
      Book::Books.find do |book|
        if book.name == book_name
          if book.qty >= 1
            puts "book request sent to admin!"
            Issue_details.find { |user|
            if user.s_id.eql? Users.s_id
              user.status = "Pending"
              user.book_name = book_name
            end
            }
          else
            puts "insuficient quantity"
          end
        else
          puts "book not available."  
        end
      end
    end
  end
end
