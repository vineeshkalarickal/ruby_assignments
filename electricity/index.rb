$LOAD_PATH << '.'
require 'user_details'
class ElectricityConsumerDetails
  user_bill = UserDetails.new
  puts 'Enter number of users need to be added: '
  user_count  = gets.chomp.to_i

  if user_count >= 0
    i = 1
    while i <= user_count
      puts "Enter User Name # #{i}: "
      uname = gets.chomp.to_s
      puts 'Enter No of Units Consumed: '
      units = gets.chomp.to_i
      total_bill = user_bill.calculate(uname, units)
      user_bill.details(uname, units, total_bill)
      i += 1
    end
  else
    puts '--- Please provide a valid number -------'
  end
end

ElectricityConsumerDetails.new