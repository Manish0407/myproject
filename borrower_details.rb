module Borrower_Details
  def Borrower_Details.details
    File.foreach("sample.txt") { |block| puts block}
  end
end