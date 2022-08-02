$LOAD_PATH << '.'
require 'admin.rb'
require 'student.rb'
module Users
  extend Admin
  extend Student
  def first
    @admin_user = [{"admin" => "admin123"}]
    @student_user = []
    start
  end
  
  def start
    puts "Who are you (admin/student)"
    input = gets.chomp
    if input == "admin"
      puts "Press 1. for signin."
      puts "Press any key for back."
      choice = gets.to_i
      if choice == 1
        user
      else
        start
      end
    elsif input == "student"
      puts "Press 1. for signin."
      puts "Press 2. for signup."
      puts "Press any key for back."
      choice = gets.to_i 
      if choice == 1
        user
      elsif choice == 2
        signup_student
        start
      else
        start
      end
    elsif input == "exit"
      exit
    else
      start           
    end
  end
  def user
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
    elsif @student_user.include?signin
      puts "======================================================================================="
      puts "...................................Welcome to student page..............................."
      puts "======================================================================================="
      Users.student_choice
    
    else
      puts "Wrong username or password!"
        user
    end
  end

  def signup_student
    print "Enter username : "
    username = gets.chomp
    print "Enter password : "
    password = gets.chomp
    
    signup = {
      username => password
    }
    @student_user.push(signup)
    puts "New student created successfully!"
  end

  def signup_admin
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
