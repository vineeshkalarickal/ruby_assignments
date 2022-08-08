$LOAD_PATH << '.'
require 'config'
require 'coin_toss'
require 'score_card'
require 'team_details'
class PlayMatch < TeamDetails

  include ScoreCard

  def initialize(match_format)
    @match_format = match_format
  end
  # get and set method
  attr_accessor :match_format
 
  def total_balls
    format = self.match_format.to_i
    case format
    when 1
      total_balls = $TEST_OVERS*6
    when 2
      total_balls = $ODI_OVERS*6
    when 3
      total_balls = $T20_OVERS*6
    else
      total_balls = 0
    end
    return total_balls
  end

  def match(team, bowling, innings)
    td = TeamDetails.new

    score_card = (0..9).to_a
    @total = 0
    @runs_in_over = 0
    balls = 0
    over = 0
    wickets = 0
    
    puts "team #{team}"

    batting_team = td.select_batting_team(team, 1)
    
    puts ' |--------------------------| '
    puts " |----+ Innings #{innings} Starts +----| "
    puts ' |--------------------------| '
    players = batting_team[0..1]

    total_balls = self.total_balls.to_i

    total_balls.times do |i|
      players.each do |a|

        ball = score_card.shuffle.first

        self.show_over_details(balls)

        # checking the conditions
        if [5, 7, 8, 9].include? ball
          puts ' Dot ball '
        elsif ball.zero?
          puts "#{a} gets out"
          wickets += 1
          batting_team.delete(a)
          puts "|----+ Players remaining are #{batting_team.count} +----| "
          players = batting_team[0..1]
          puts "|----+ Innings ends, Total runs scored #{@total}  +----| " if batting_team == []
          puts "|----+ New player came to bat #{players}  +----| " if players &.any?
          # Abort if no players left
          if players.nil?
            self.final_scorecard(@total, over, bowling, innings)
            return @total
          end

        else
          puts "Hits #{ball} runs"
          @runs_in_over += ball
          @total += ball
        end 

        balls += 1
        if (balls % 6).zero?
          over += 1
          self.show_scorecard(@total, over, wickets)
          @runs_in_over = 0
          sleep 1
        end

        if balls == total_balls
          self.final_scorecard(@total, over, bowling, innings)
          return @total
        end
      end
    end
  end
end
