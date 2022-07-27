$LOAD_PATH << '.'
require 'bill_calculator'

class UserDetails
  include BillCalculator
  @@user_details = []

  def details(uname, units, tot_bill)
    @@user_details.push({ 'UserName' => uname, 'UnitsConsumed' => units, 'BillAmount' => tot_bill.to_f.round(2) })
    i = 0
    puts ' |-------------------------------------|'
    puts '   Sl.No | Name | Units Used | Total    '
    puts ' |-------------------------------------|'
    @@user_details.each_with_index do |details, i|
      puts "   #{i + 1} | #{details['UserName']}  | #{details['UnitsConsumed']}  |  #{details['BillAmount']}"
    end
  end
end