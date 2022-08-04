require 'byebug'
require 'book.rb'
require 'users.rb'
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

  def self.request
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
        elsif if r.status == "cancel"
          puts "you cancel the request."  
        else
          puts "you done #{r.status}"  
        end
      end
    end
  end  
  
  def self.issue
    count = 0
    print "Enter book name : "
    book_name = gets.chomp
    if BookIssue.search(book_name)
      Book::Books.find do |book|
        if book.name == book_name
          if book.qty >= 1
            puts "book request sent to admin!"
            BookIssue.new(Users.name, book_name, "pending")  
          else
            puts "insuficient quantity"
          end
        end
      end
    else
      puts "book not available."
    end
  end
  
  def self.details
    Issue_details.select do |i|
      puts "student name = #{i.name} \nbook_name = #{i.book_name}\n quantity = #{i.status}"
    end   
  end

  def self.allotment
    count = 0
    Issue_details.select do |i|
      if i.name == Users.name
        puts "student name = #{i.name} \nbook_name = #{i.book_name}\n quantity = #{i.status}"
        break
      else
        count +=1
        if count == 1
          puts "No books issued yet!"
        end
      end
    end   
  end

  def self.search(book_name)
    Book::Books.select { |book| book.name == book_name }.first
   end 

  def self.find_by(name)
    Issue_details.select { |item| item.book_name == name }.first
  end

  def self.return
    print "Enter book name you want to return :"
    name = gets.chomp
    unless BookIssue.find_by(name).nil?
      Issue_details.select do |i|
        if i.book_name == name
          if Users.name == i.name
            i.status = "deposit"
            i.book_name.clear
          end
          Book::Books.find do |book|
            if book.name == name
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
end
end