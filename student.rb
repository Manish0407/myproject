module Student
  def student_choice
    puts "\t \tPress 1. for book details."
    puts "\t \tPress 2. for issue book."
    puts "\t \tPress 3 for return book"
    puts "\t \tPress 4. for logout."
    print "\t \tPlease enter your choice : "
    choice = gets.to_i
    Library.student(choice)
    
  end
  def student_repeat
    puts "=============================================================================================================================================="
    print "\t \tDo you want to continue (yes/no) :"
    input = gets.chomp

    if input == "yes"
      puts "=============================================================================================================================================="
      puts "...............................................................Welcome again!................................................................."
      puts "=============================================================================================================================================="
      student_choice
    else
      puts "=============================================================================================================================================="
      puts "...............................................................Thank You!................................................................."
      puts "=============================================================================================================================================="
      exit
    end
  end
end