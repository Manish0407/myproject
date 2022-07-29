 module BookDetails
  def books
    $hash = {
       "1" => " Pride and Prejudice by Jane Austen (1870)",
       "2" => " The Adventures of Sherlock Holmes by Arthur Conan Doyle (1014)",
       "3" => " Persuasion by Jane Austen (675)",
       "4" => " Frankenstein; Or, The Modern Prometheus by Mary Wollstonecraft Shelley (620)",
       "5" => " Alice's Adventures in Wonderland by Lewis Carroll (786)",
       "6" => " Moby Dick; Or, The Whale by Herman Melville (594)",
       "7" => " Dracula by Bram Stoker (553)",
       "8" => " Grimms' Fairy Tales by Jacob Grimm and Wilhelm Grimm (510)",
       "9" => " Calculus Made Easy by Silvanus P. Thompson (506)",
       "10" => " The Picture of Dorian Gray by Oscar Wilde (491)",
       "11" => " A Tale of Two Cities by Charles Dickens (489)",
       "12" => " The Count of Monte Cristo, Illustrated by Alexandre Dumas (486)",
       "13" => " Ulysses by James Joyce (460)",
       "14" => " War and Peace by graf Leo Tolstoy (413)",
       "15" => " Metamorphosis by Franz Kafka (398)",
       "16" => " Great Expectations by Charles Dickens (366)",
       "17" => " The Iliad by Homer (365)",
       "18" => " The Yellow Wallpaper by Charlotte Perkins Gilman (354)",
       "19" => " The Great Gatsby by F. Scott Fitzgerald (351)",
       "20" => " Crime and Punishment by Fyodor Dostoyevsky (347)"}
     
    $hash.each do |k,v|
      puts "#{k} = #{v}"
    end
  end
end