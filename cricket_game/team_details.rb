$LOAD_PATH << '.'
require 'config'

class TeamDetails
  def show_team
    puts "Team A:  #{$TEAM_A.join(",")} \n\n  "
    sleep 1
    puts "Team B: #{$TEAM_B.join(",")} \n\n "
  end
  def select_batting_team(team, innings)
    if(team == "A")
      batting_team = $TEAM_A
      bowling_team = $TEAM_B
    else
      batting_team = $TEAM_B
      bowling_team = $TEAM_A
    end

    if(innings == 1)
      return batting_team
    else
      return bowling_team
    end
    
  end
end