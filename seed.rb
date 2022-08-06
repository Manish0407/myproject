require 'book.rb'
require 'book_issue.rb'
require 'users.rb'
class Seed
  def self.seeds
    Book.new("c","denis",10)
    Book.new("computer science","klp",10)
    Book.new("data science","AD",10)
    Book.new("ruby","K",10)
    Book.new("python","Rosam",10)

    Users.new("manish","manish04")
    Users.new("pratik","pratik12")
    Users.new("shashank","sha12")
    Users.new("urvashi","urvashi12")
  end
end