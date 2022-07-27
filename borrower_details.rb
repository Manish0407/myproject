module Borrower_Details
  def Borrower_Details.details
    File.foreach("details.txt") { |block| puts block}
  end
end