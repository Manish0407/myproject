require 'book.rb'
class BookIssue 
  Issue_details = []
  ARR = []
  attr_accessor :cust_id, :book_id, :book_name, :author, :name, :qty
  def initialize(cust_id, book_id, book_name, book_author, name,qty)
    @cust_id = cust_id
    @book_id = book_id
    @book_name = book_name
    @author = book_author
    @name = name
    @qty = qty

    ARR << self
    puts "book request sent to admin!"
  end

  def self.request
    if ARR.empty? || ARR == nil
      puts "No requests"
    else
      puts "you have issue request. "
      ARR.select do |i|
        puts "cust_id = #{i.cust_id} \n book_id = #{i.book_id}\n book_name = #{i.book_name}\n book_author = #{i.author}\n student name = #{i.name} \n quantity = #{i.qty}"
      end
      puts "do you want to accept (yes/no) :"
      input = gets.chomp
      if input == "yes"
        ARR.select do |data|
          Issue_details << data
          Book::Books.find do |book|
            if book.name == data.book_name
              book.qty -= data.qty
              puts "Book issued successfully."
              ARR.clear
            end
          end
        end
      else
        puts "you cancel the request."
      end
    end
  end
  
  def self.issue
    count = 0
    print "Enter cust id : "
    cust_id = gets.to_i
    print "Enter book id : "
    book_id = gets.to_i
    print "Enter book name : "
    book_name = gets.chomp
    print "Enter author name : "
    book_author = gets.chomp
    print "Enter student name : "
    name = gets.chomp
    print "Enter book qty : "
    qty = gets.to_i
    if qty != 0
      Book::Books.find do |book|
        if book.name == book_name
          if book.qty >= qty
            if book.author == book_author
              BookIssue.new(cust_id, book_id, book_name, book_author, name,qty)
            else
              puts "you entered wrong author name."
            end  
          else
            puts "insuficient quantity"
          end
        else
          count+=1
          if count == 1
            puts "book not available."
          end  
        end
      end
    else
      puts "Quantity should be greater then zero!"
    end     
  end
  
  def self.details
    Issue_details.select do |i|
      puts "cust_id = #{i.cust_id} \n book_id = #{i.book_id}\n book_name = #{i.book_name}\n book_author = #{i.author}\n student name = #{i.name} \n quantity = #{i.qty}"
    end   
  end

  def self.return
    print "Enter book name you want to return :"
    name = gets.chomp
    print "Enter quantity :"
    qty = gets.to_i
    Issue_details.find do |i|
      if i.book_name == name
        i.qty -= qty
        puts "Book return successfully"
      else
        puts "The information provided by you is not available in our records."
      end
    end
    Book::Books.find do |book|
      if book.name == name
        book.qty += qty
      end
    end
  end
end