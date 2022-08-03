require 'book_issue.rb'
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

  def self.book_add
    print "Enter book name : "
    name = gets.chomp
    print "Enter book author name : "
    author =gets.chomp
    print "Enter book quantity : "
    qty =gets.to_i

    Book.new(name, author,qty)
  end
  
  def self.update
    print "Enter book name : "
    name = gets.chomp
    print "Enter book quantity you want to add : "
    qty = gets.to_i
    Books.select do |book|
      if book.name == name
        book.qty += qty
        break
      end
    end
    puts "Book updated successfully."
  end  

  def self.delete
    print "Enter book name : "
    name = gets.chomp
    print "Enter book quantity you want to delete : "
    qty = gets.to_i
    Books.select do |book|
      if book.name == name
        book.qty -= qty
        break
      end
    end
    puts "Book deleted successfully." 
  end

  def self.collection
    Books.select do |book|
      puts "#{book.id}. #{book.name} by #{book.author} qty(#{book.qty})"
    end   
  end
end
