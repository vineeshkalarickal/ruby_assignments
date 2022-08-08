$LOAD_PATH << '.'
require 'show_team'

class Index
  def initialize
    #show team list
    ShowTeam.new

    puts "Enter the match format: 1=> TEST 2=> ODI and 3=> T20 4=> Quit Game"
    $MATCH_FORMAT = gets.chomp.to_i

    exit_choice_proc = Proc.new { |choice|
      choice == 'Y' ? at_exit { puts '|| See you, Thank you ||' } : self.initialize
    }

    case $MATCH_FORMAT
    when 1
      puts "You have selected the TEST Match "
    when 2
      puts "You have selected the ODI Match "
    when 3
      puts "You have selected the T20 Match "
    when 4
      puts 'Do you want to exit? Y/N '
      exit_choice_proc.call(gets.chomp.upcase)
    else
      puts 'Wrong choice, Please enter numeric value '
      self.initialize
    end 

    require 'play_match'

  end
end


Index.new
