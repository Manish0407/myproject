module Admin
  def admin_choice
    puts "\t \t1. Add New Book."
    puts "\t \t2. Book Update."
    puts "\t \t3. Book Details."
    puts "\t \t4. Book Delete."
    puts "\t \t5. Book Issue."
    puts "\t \t6. Student Details."
    puts "\t \t7. Create New Student."
    puts "\t \t8. Create New Admin."
    puts "\t \t9. Logout."
    print "\t \tPlease enter your choice : "
    choice = gets.to_i
    Library.admin(choice)
  end

  def admin_repeat
    puts "=============================================================================================================================================="
    print "\t \tDo you want to continue (yes/no) :"
    input = gets.chomp

    if input == "yes" || input == "y"
      puts "=============================================================================================================================================="
      puts "...............................................................Welcome again!................................................................."
      puts "=============================================================================================================================================="
      admin_choice
    elsif input == "no" || input == "n"
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
