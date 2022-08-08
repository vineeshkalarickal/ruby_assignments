$LOAD_PATH << '.'
require 'config'

class Coin_Toss

  def select_choice

    puts "Select coin side for Team A: 1=> HEADS 2=> TAILS"
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
    team_a_choice = self.select_choice
    puts "Team A calls #{team_a_choice}"
    toss = $COIN.shuffle.first
    puts "Coin shows #{toss}"
    if toss == team_a_choice
      puts 'Team A won the toss and selected to bat first'
      @@bat_fitst = 'A'
    else
      puts 'Team B won the toss and selected to bat first'
      @@bat_fitst = 'B'
    end
    @@bat_fitst
  end

  def get_bowling_team(team)
    team == 'A' ? 'B' : 'A'
  end
end