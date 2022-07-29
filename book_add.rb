$LOAD_PATH << '.'
require 'book_details.rb'
module BookAdd
  $books_collection = []
  def book_add
    print "Enter book id : "
    book_id = gets.to_sym
    print "Enter book name : "
    book_name = gets.chomp
    print "Enter book author name : "
    book_author =gets.chomp
    print "Enter book pages : "
    book_page = gets.to_i
    $hash[book_id] = " #{book_name} by #{book_author} (#{book_page})"
    $hash.each do |k,v|
      puts "#{k} = #{v}"
    end
  end
end