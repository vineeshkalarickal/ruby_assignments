$LOAD_PATH << '.'
require 'config'

class Coin_Toss < TeamDetails

  def initialize
    @teams = self.get_team_details
    @first_team = self.get_playing_eleven('first')
    @second_team = self.get_playing_eleven('second')
    @team1 =  @teams[0]
    @team2 =  @teams[1]
  end

    # get and set method
    attr_accessor :team1, :team2


  def select_choice
    puts "------+ TOSS +-------"
    puts "Select coin side for #{self.team1}: 1=> HEADS 2=> TAILS"
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
    puts "\n---+ #{self.team1} calls #{first_team_choice} +---"
    toss = $COIN.shuffle.first
    puts "\n---+ Coin shows #{toss} +---"
    if toss == first_team_choice
      puts "\n---+ #{self.team1} won the toss and selected to bat first +---"
      @bat_fitst = 'A'
    else
      puts "\n---+ #{self.team2} won the toss and selected to bat first +---"
      @bat_fitst = 'B'
    end
    @bat_fitst
  end

  def get_bowling_team(team)
    team == 'A' ? 'B' : 'A'
  end
end