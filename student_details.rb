module StudentDetails
  def details
    $issue_details.each do |each_hash|
      each_hash.each do |k, v|
        puts "#{k} => #{v}"
      end
      puts
    end
  end
end