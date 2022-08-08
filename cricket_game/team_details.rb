$LOAD_PATH << '.'
require 'config'
class TeamDetails

  include GetTeamDetails

  def add_players(team_name)
    puts "---+ Add #{team_name} team players +---"
    @player_name = Hash.new
    (1..5).each do |i|
      puts "Add player #{i} name: "
      @player_name[i] = gets.chomp.upcase
    end

    f = File.new('playing_eleven.rb', 'a+')
    @players = self.hash_to_a(@player_name)
    f.puts "#{@players}"
    f.close

  end


  def add_team
    @team_name = Hash.new
    (0..1).each do |i|
      team = i == 0 ? 'First' : 'Second'
      puts "Enter the #{team} team name: "
      @team_name[i] = gets.chomp.upcase
    end

    f = File.new('playing_eleven.rb', 'w+')
    @team = self.hash_to_a(@team_name)
    f.puts "#{@team}"
    f.close

  end

  def hash_to_a(a_hash)
    result = []
    a_hash.each { |k, v|
      if v.is_a?(Hash)
        result << v.to_a
      else
        result << v
      end
    }
    result
  end

  def show_team
    #puts "#{$TEAMS[0]}: "
    puts "#{@first_team.join(",")} \n\n "
    sleep 1
    #puts "#{$TEAMS[1]}: "
    puts "#{@second_team.join(",")} \n\n "
  end

  def select_batting_team(team, innings)
    if team == "A"
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