module StudentDetails
  def details
    $issue_details.each do |each_hash|
        each_hash.each do |each_hash_element|
          each_hash_element.each do |k,v|
            print "#{k}  #{v}"
          end
          puts
        end
      end
      
  end
end