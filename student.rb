module Student
  def self.student_choice
    puts "\t \t1. Book Details."
    puts "\t \t2. Issue Book."
    puts "\t \t3. Return Book."
    puts "\t \t4. Books"
    puts "\t \t5. Logout."
    print "\t \tPlease enter your choice : "
    choice = gets.to_i
    Library.student(choice)
    
  end
end