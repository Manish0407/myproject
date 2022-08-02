module Admin
  def admin_choice
    puts "\t \tPress 1. for add new book."
    puts "\t \tPress 2. for book issue."
    puts "\t \tPress 3. for book delete."
    puts "\t \tPress 4. for book details."
    puts "\t \tPress 5. for student details."
    puts "\t \tPress 6. for create new student."
    puts "\t \tPress 7. for create new admin."
    puts "\t \tPress 8. for logout."
    print "\t \tPlease enter your choice : "
    choice = gets.to_i
    Library.admin(choice)
  end

  def admin_repeat
    puts "=============================================================================================================================================="
    print "\t \tDo you want to continue (yes/no) :"
    input = gets.chomp

    if input == "yes"
      puts "=============================================================================================================================================="
      puts "...............................................................Welcome again!................................................................."
      puts "=============================================================================================================================================="
      admin_choice
    elsif input == "no"
      puts "=============================================================================================================================================="
      puts "...............................................................Thank You!................................................................."
      puts "=============================================================================================================================================="
      exit
    else
      puts "you entered wrong key"
      admin_repeat
    end
  end
end