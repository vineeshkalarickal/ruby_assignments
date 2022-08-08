$LOAD_PATH << '.'
require 'config'

class Coin_Toss
  
  include GetTeamDetails

  def select_choice

    puts "Select coin side for #{@first_team}: 1=> HEADS 2=> TAILS"
    toss_choice = gets.chomp.to_i

    case toss_choice
    when 1
      toss = 'Heads'
    when 2
      toss = 'Tails'
    else
      self.call
    end
    return toss
  end

  def call
    first_team_choice = self.select_choice
    puts "#{@first_team} calls #{first_team_choice}"
    toss = $COIN.shuffle.first
    puts "Coin shows #{toss}"
    if toss == first_team_choice
      puts "#{@first_team} won the toss and selected to bat first"
      @bat_fitst = 'A'
    else
      puts 'Team B won the toss and selected to bat first'
      @bat_fitst = 'B'
    end
    @bat_fitst
  end

  def get_bowling_team(team)
    team == 'A' ? 'B' : 'A'
  end
end