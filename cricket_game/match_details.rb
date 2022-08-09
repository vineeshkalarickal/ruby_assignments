$LOAD_PATH << '.'
require 'config'

class MatchDetails

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

