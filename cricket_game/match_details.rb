$LOAD_PATH << '.'
require 'config'
class MatchDetails

  def initialize(match_format)
    @match_format = match_format
  end
  # get and set method
  attr_accessor :match_format

  def total_balls

    match_type = self.match_format.to_i
    case match_type
    when 1
      balls = $TEST_OVERS*6
    when 2
      balls = $ODI_OVERS*6
    when 3
      balls = $T20_OVERS*6
    else
      balls = 0
    end
  end

  def show_match_details(match_format)
    puts match_format
  end

  def checkResult(current_run, first_innings_score)
    if current_run >= first_innings_score
      return true
    end
  end

  def setWickets(wickets)
    @wickets = wickets
  end

  def getWickets
    @wickets
  end

  def final_verdict(score_details)
    first_innings = score_details['first_innings']
    second_innings = score_details['second_innings']
    batting = score_details['batting']
    bowling = score_details['bowling']
    wickets = score_details['wickets']

    puts "\n\n #{bowling} chased #{first_innings} runs and scored #{second_innings} "

    if first_innings > second_innings      
      puts "\n\n Result: #{batting} won the match by #{first_innings - second_innings} runs"
    elsif first_innings < second_innings
      puts "\n\n Result: #{bowling} won the match by #{($TOTAL_PLAYERS-1) - wickets} wickets"
    else
      puts 'Match Tied'
    end
  end
end

