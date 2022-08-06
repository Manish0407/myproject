$LOAD_PATH << '.'
require 'book_issue.rb'
require 'book.rb'
class Users
  STUDENT = []
  attr_accessor :s_id, :username, :password
  def initialize(username,password)
    @s_id = set_id
    @username = username
    @password = password

    STUDENT << self
    BookIssue.new(@s_id,@username,"nil","nil")
  end

  def set_id
    ( STUDENT.last&.s_id || 0 ) + 1
  end
  class << self
    def first
      @admin_user = [{"admin" => "admin123"}]
      start
    end
    
    def start
      puts "A. admin."
      puts "S. student."
      puts "E. exit."
      input = gets.chomp
      if input == "a" || input == "A"
        user
      elsif input == "s" || input == "S"
        puts "1. signin."
        puts "2. signup."
        puts "[any key]. for back."
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

    def find_by(username,password)
      STUDENT.select { |i| i.username == username && i.password == password}.first
    end  

    def user
      # SNAME = ""
      print "Enter username : "
      username = gets.strip
      print "Enter password : "
      password = gets.strip

      signin = {
        username => password
      }
      if Users.find_by(username,password)  
        @@s_name = username
        STUDENT.find { |user|
          if user.username == username
            @@s_id = user.s_id
          end
        }
        puts "======================================================================================="
        puts "...................................Welcome #{username}..............................."
        puts "======================================================================================="  
        Student.student_choice
      elsif @admin_user.include?signin
        puts "======================================================================================="
        puts "...................................Welcome to admin page..............................."
        puts "======================================================================================="
        Admin.admin_choice    
      else
        puts "Wrong username or password!"
        Users.user
      end
    end

    def name
      @@s_name
    end

    def s_id
      @@s_id
    end

    def signup_student
      print "Enter username : "
      username = gets.chomp
      print "Enter password : "
      password = gets.chomp
      
      if STUDENT.include?username
        puts "student already exist"
      else 
        if username.length < 3 
          puts "username should be minimum 3 charecter"
        else
          if password.length < 3
            puts "password should be minimum 3 charecter" 
          else   
            puts "New student created successfully!"
            Users.new(username,password)
            BookIssue.new(username,"nil",0)
          end
        end
      end  
    end

    def signup_admin
      print "Enter username : "
      username = gets.chomp
      print "Enter password : "
      password = gets.chomp
      
      signup = {
        username => password
      }
      if username.length < 3 
        puts "username should be minimum 3 charecter"
      else
        if password.length < 3
          puts "password should be minimum 3 charecter" 
        else   
          @admin_user.push(signup)
          puts "New admin created successfully!"
        end
      end
    end
  end
end
