$LOAD_PATH << '.'
require 'choice.rb'
require 'student.rb'
module Login
  extend Admin
  extend Student
  def user
    print "Enter username : "
    username = gets.chomp
    print "Enter password : "
    password = gets.chomp

    if username == "admin"
      if password == "admin123"
        puts "======================================================================================="
        puts "...................................Welcome to admin page..............................."
        puts "======================================================================================="
        Login.admin_choice
      else
        puts "Wrong password for admin please enter valid password"
        user
      end
    elsif username == "student"
      if password == "student123"
        puts "======================================================================================="
        puts "...................................Welcome to student page..............................."
        puts "======================================================================================="
        Login.student_choice
        Login.student_repeat
      else
        puts "Wrong password for student please enter valid password"
        user
      end
    else
      puts "invalid username"
      puts "==========================================================================================================="
      user
    end
  end
end
