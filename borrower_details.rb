module Borrower_Details
  def Borrower_Details.details
    # File.foreach("details.txt") do |read| 
    #   read
    # end
    $issue_details.each do |each_hash|
        each_hash.each do |each_hash_element|
          each_hash_element.each do |k,v|
            puts "#{k}  #{v}"
          end
        end
      end
  end
end