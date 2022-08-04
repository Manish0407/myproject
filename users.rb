$LOAD_PATH << '.'
require 'admin.rb'
require 'student.rb'
class Users
  #extend Admin
  #extend Student
  STUDENT = []
  attr_accessor :s_id :username, :password, :book
  def initialize(name,pass,book)
    @s_id = set_incremental_id
    @name = name
    @pass = pass
    @book = book

    STUDENT << self
  end
  def set_incremental_id
    (Books.last&.id || 0) + 1
  end
  def self.first
    @admin_user = [{"admin" => "admin123"}]
    @student_user = []
    start
  end
  
  def self.start
    puts "A. admin."
    puts "S. student."
    puts "E. exit."
    input = gets.chomp
    if input == "a" || input == "A"
      puts "1. for signin."
      puts "\t Press any key for back."
      choice = gets.to_i
      if choice == 1
        user
      else
        start
      end
    elsif input == "s" || input == "S"
      puts "1. signin."
      puts "2. signup."
      puts "\t Press any key for back."
      choice = gets.to_i 
      if choice == 1
        user
      elsif choice == 2
        signup_student
        start
      else
        start
      end
    elsif input == "e" || input == "E"
      exit
    else
      start           
    end
  end
  def self.user
    print "Enter username : "
    username = gets.chomp
    print "Enter password : "
    password = gets.chomp

    signin = {
      username => password
    }

    if @admin_user.include?signin
      puts "======================================================================================="
      puts "...................................Welcome to admin page..............................."
      puts "======================================================================================="
      Users.admin_choice
    elsif STUDENT.include?username
      if STUDENT.include?password
        S_name = username
        puts "======================================================================================="
        puts "...................................Welcome #{username}..............................."
        puts "======================================================================================="  
        Users.student_choice
      end
    end    
    
    else
      puts "Wrong username or password!"
        user
    end
  end

  def self.signup_student
    print "Enter username : "
    username = gets.chomp
    print "Enter password : "
    password = gets.chomp
    
    if STUDENT.include?username
      puts "student already exist"
    else  
      users.new(username,password,0)
      puts "New student created successfully!"
    end  
  end

  def self.signup_admin
    print "Enter username : "
    username = gets.chomp
    print "Enter password : "
    password = gets.chomp
    
    signup = {
      username => password
    }
    @admin_user.push(signup)
    puts "New admin created successfully!"
  end
end
