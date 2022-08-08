$LOAD_PATH << '.'
require 'team_details'

class Index

  def initialize
    require 'play_match'
    # show team list
    td = TeamDetails.new
    td.show_team

    puts ' Enter the match format: 1=> TEST 2=> ODI and 3=> T20 4=> Quit Game '
    $MATCH_FORMAT = gets.chomp.to_i
    play = PlayMatch.new $MATCH_FORMAT

    exit_choice_proc = Proc.new { |choice|
      choice == 'Y' ? at_exit { abort '|| See you, Thank you ||' } : self.initialize
    }

    case $MATCH_FORMAT
    when 1
      puts 'You have selected the TEST Match '
    when 2
      puts 'You have selected the ODI Match '
    when 3
      puts 'You have selected the T20 Match '
    when 4
      puts 'Do you want to exit? Y/N '
      exit_choice_proc.call(gets.chomp.upcase)
    else
      puts 'Wrong choice, Please enter numeric value '
      self.initialize
    end

    return unless [1, 2, 3].include? $MATCH_FORMAT

      # call for the toss
      coin_toss = Coin_Toss.new
      batting = coin_toss.call
      bowling = coin_toss.get_bowling_team(batting)

      # play 1
      first_innings = play.match(batting, bowling, 1)
      # play 2
      second_innings = play.match(bowling, batting, 2)

      require 'match_details'
      match_det = MatchDetails.new
      match_det.final_verdict(first_innings, second_innings, batting, bowling)

  end
end

Index.new

