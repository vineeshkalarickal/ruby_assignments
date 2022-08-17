$LOAD_PATH << '.'
require 'config'
require 'coin_toss'
require 'score_card'
require 'team_details'
class PlayMatch < TeamDetails

  include ScoreCard

  def match(team, bowling, innings)
    md = MatchDetails.new $MATCH_FORMAT
    score_runs = (0..9).to_a
    @total = 0
    @runs_in_over = 0
    balls = 0
    over = 0
    wickets = 0

    puts ' |--------------------------| '
    puts " |----+ Innings #{innings} Starts +----| "
    puts ' |--------------------------| '

    batting_team = self.select_batting_team(team, 1)
    players = batting_team[0..1]

    total_balls = md.total_balls.to_i

    flag = 0
    total_balls.times do |i|
      players.each do |a|
        if flag == 1
          flag = 0
          next
        end
        ball = score_runs.shuffle.first
        self.show_over_details(balls)
        # checking the conditions
        if [5, 7, 8, 9].include? ball
          puts "#{a} on strike: Hits No Run "
          flag = 1
        elsif ball.zero?
          puts "#{a} gets out by #{$OUT.shuffle.first}"
          wickets += 1
          batting_team.delete(a)
          players = batting_team[0..1]
          unless batting_team.count != 1 || batting_team == []
            puts "|----+ #{team} All out!!, Total runs scored #{@total}  +----| "
            # Abort if no players left
            final_scorecard(@total, over, bowling, innings)
            return @total
          end
          puts "|----+ Remaining players #{players}  +----| " if players&.any?
        else
          puts "#{a}  on strike: Hits #{ball} runs"
          if [2, 4, 6].include? ball
            flag = 1
          end
          @runs_in_over += ball
          @total += ball
        end
        balls += 1
        if (balls % 6).zero?
          over += 1
          show_scorecard(@total, over, wickets)
          @runs_in_over = 0
          sleep 1
          flag = 0
        end
        if balls == total_balls
          final_scorecard(@total, over, bowling, innings)
          return @total
        end
      end
    end
  end
end

