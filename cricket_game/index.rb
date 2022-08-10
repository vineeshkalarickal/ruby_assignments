$LOAD_PATH << '.'
require 'config'
require 'team_details'
require 'play_match'
class Index

  def initialize

    @match_format = self.set_match_type
    # show team list
    td = TeamDetails.new
    play = PlayMatch.new
    # add team
    td.add_team
    td.add_players('first')
    td.add_players('second')
    td.show_team
    td.show_match_details(@match_format)
    # call for the toss
    coin_toss = Coin_Toss.new
    batting = coin_toss.call
    bowling = coin_toss.get_bowling_team(batting)

    # play 1
    first_innings = play.match(batting, bowling, 1).to_i
    # play 2
    second_innings = play.match(bowling, batting, 2).to_i

    score_details = {
      'first_innings' => first_innings,
      'second_innings' => second_innings,
      'batting' => batting,
      'bowling' => bowling
    }

    if @match_format == 1
      # play 1
      third_innings = play.match(batting, bowling, 3).to_i
      # play 2
      fourth_innings = play.match(bowling, batting, 4).to_i
      score_details['third_innings'] = third_innings
      score_details['fourth_innings'] = fourth_innings
    end

    require 'match_details'
    match_det = MatchDetails.new @match_format
    match_det.final_verdict(score_details)
  end

  def set_match_type
    puts 'Enter the match format: 1=> TEST 2=> ODI and 3=> T20 4=> Quit '
    match_format = gets.chomp.to_i
    # set to global
    $MATCH_FORMAT = match_format

    exit_choice_proc = Proc.new { |choice|
      choice == 'Y' ? at_exit { abort '|| See you, Thank you ||' } : self.initialize
    }

    case match_format
    when 1
      puts 'You have selected the TEST Match '
      puts ' Need to implement, choose anothe option for now '
      self.initialize
    when 2
      puts 'You have selected the ODI Match '
    when 3
      puts 'You have selected the T20 Match '
    when 4
      puts 'Do you want to exit? Y/N '
      exit_choice_proc.call(gets.chomp.upcase)
      exit
    else
      puts 'Wrong choice '
    end
    return unless [1, 2, 3].include? match_format
  end

end

Index.new

