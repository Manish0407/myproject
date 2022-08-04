module Admin
  def self.admin_choice
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
end
