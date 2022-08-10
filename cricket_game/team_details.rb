$LOAD_PATH << '.'
require 'csv'
require 'config'
require 'match_details'
class TeamDetails < MatchDetails

  def initialize
    @teams = self.get_team_details
    @first_team = self.get_playing_eleven('first')
    @second_team = self.get_playing_eleven('second')
    @team1 =  @teams[0]
    @team2 =  @teams[1]
  end

  # get and set method
  attr_accessor :team1, :team2, :first_team, :second_team

  def add_team
    @team_name = Hash.new
    (0..1).each do |i|
      team = i == 0 ? 'First' : 'Second'
      puts "Enter the #{team} team name: "
      @team_name[i] = gets.chomp.upcase
    end

    f = File.new('team.csv', 'w+')
    @team_name.each do |key, values|
      f.print "#{values},"
    end
    f.close
  end

  def add_players(team_name)
    puts "---+ Add #{team_name} team players +---"

    if team_name == 'first'
      file_name = 'first_eleven.csv'
    else
      file_name = 'second_eleven.csv'
    end

    @player_name = Hash.new
    (1..$TOTAL_PLAYERS).each do |i|
      puts "Add player #{i} name: "
      @player_name[i] = gets.chomp.upcase
    end

    f = File.new(file_name, 'w+')
    @player_name.each do |key, values|
      f.print "#{values},"
    end
    f.close

  end

  def get_team_details
    @teams = nil
    f = File.open("team.csv", "r+") if File.exist?("team.csv")
      lines = f.readlines
      @teams = lines[0].split(',')
    f.close
    return @teams
  end
  
  def get_playing_eleven(team_name)
    @playing_eleven = nil
    if team_name == 'first'
      file_name = 'first_eleven.csv'
    else
      file_name = 'second_eleven.csv'
    end

    f = File.open(file_name, "r+") if File.exist?(file_name)
      lines = f.readlines
      @playing_eleven = lines[0].split(',')
    f.close
    return @playing_eleven
  end


  def show_team

    @teams = self.get_team_details
    @first_team = self.get_playing_eleven('first')
    @second_team = self.get_playing_eleven('second')
    @team1 =  @teams[0]
    @team2 =  @teams[1]
    puts "\n\n"
    puts "#{@team1} vs #{@team2} \n\n"
    puts "#{@team1} : #{@first_team.join(",")} \n\n "
    sleep 1
    puts "#{@team2}: #{@second_team.join(",")} \n\n "
  end

  def select_batting_team(team, innings)

    @teams = self.get_team_details
    @first_team = self.get_playing_eleven('first')
    @second_team = self.get_playing_eleven('second')
    @team1 =  @teams[0]
    @team2 =  @teams[1]

    if team == @team1
      batting_team = @first_team
      bowling_team = @second_team
    else
      batting_team = @second_team
      bowling_team = @first_team
    end

    return batting_team if innings == 1
    return bowling_team if innings == 2
  end

end