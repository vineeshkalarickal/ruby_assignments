$LOAD_PATH << '.'
require 'config'

class MatchDetails
  def final_verdict(first_innings, second_innings, bowling, team)

    if first_innings > second_innings
      puts "Team #{team} won the match by #{first_innings - second_innings} runs"
    else
      puts "Team #{bowling} won the match by #{second_innings - first_innings} runs"
    end

  end
end

