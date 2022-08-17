$LOAD_PATH << '.'
require 'config'

class CoinToss < TeamDetails

  def initialize
    super
    @teams = get_team_details
    @team1 =  @teams[0]
    @team2 =  @teams[1]
  end

  # get and set method
  attr_accessor :team1, :team2

  def select_choice
    puts '------+ TOSS +-------'
    puts "Select coin side for #{team1}: 1=> HEADS 2=> TAILS"
    toss_choice = gets.chomp.to_i
    case toss_choice
    when 1
      toss = 'Heads'
    when 2
      toss = 'Tails'
    else
      call
    end
    return toss unless toss.nil?
  end

  def call

    first_team_choice = select_choice
    puts "\n---+ #{team1} calls #{first_team_choice} +---"
    toss = $COIN.shuffle.first
    puts "\n---+ Coin shows #{toss} +---"
    if toss == first_team_choice
      puts "\n---+ #{team1} won the toss and selected to bat first +---"
      @bat_fitst = team1
    else
      puts "\n---+ #{team2} won the toss and selected to bat first +---"
      @bat_fitst = team2
    end
    return @bat_fitst unless @bat_fitst.nil?
  end

  def get_bowling_team(team)
    team == team1 ? team2 : team1
  end
end