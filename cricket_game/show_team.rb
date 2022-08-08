$LOAD_PATH << '.'
require 'config'

class ShowTeam
    puts "Team A:  #{$TEAM_A.join(",")} \n\n  "
    sleep 1
    puts "Team B: #{$TEAM_B.join(",")} \n\n "
end