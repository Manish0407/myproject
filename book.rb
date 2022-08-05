require 'book_issue.rb'
require 'users.rb'
require 'student.rb'
require 'admin.rb'
class Book
  Books = []
  
  attr_accessor :id, :name, :author, :qty
  
  def initialize(name, author,qty)
    @id = set_incremental_id
    @name = name
    @author = author
    @qty = qty

    Books << self
  end

  def set_incremental_id
    (Books.last&.id || 0) + 1
  end

  class << self
    def book_add
      print "Enter book name : "
      name = gets.chomp
      print "Enter book author name : "
      author = gets.chomp
      print "Enter book quantity : "
      qty = gets.to_i
      if qty >= 0
        Book.new(name, author,qty)
        puts "New book create successfully."
      end  
    end
    
    def update
      print "Enter book name : "
      name = gets.chomp
      print "Enter book quantity you want to add : "
      qty = gets.to_i
      if qty > 0
        Books.select do |book|
          if book.name == name
            book.qty += qty
            puts "Book updated successfully."
            break
          end
        end
      else
        puts "invalid quantity #{qty}"
      end  
    end  

    def delete
      print "Enter book name : "
      name = gets.chomp
      print "Enter book quantity you want to delete : "
      qty = gets.to_i
      if qty > 0
        Books.select do |book|
          if book.name == name
            if book.qty > 0
              if book.qty >= qty
                book.qty -= qty
                puts "#{qty} Book deleted successfully." 
                break
              else
                puts "Delete quantity can't be greater then collection quantity."
                break  
              end  
            end  
          end
        end
      else
        puts "can't be deleted due to quantity = #{qty}"
      end
    end

    def collection
      Books.select do |book|
        puts "#{book.id}. #{book.name} by #{book.author} qty= (#{book.qty})"
      end   
    end
  end
end
