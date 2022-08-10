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

  def final_verdict(score_details)
    first_innings = score_details['first_innings']
    second_innings = score_details['second_innings']
    batting = score_details['batting']
    bowling = score_details['bowling']

    if first_innings > second_innings
      puts "Team #{batting} won the match by #{first_innings - second_innings} runs"
    else
      puts "Team #{bowling} won the match by #{second_innings - first_innings} runs"
    end
  end
end

