$COIN = ['Heads','Tails']

#TEST
$TEST_OVERS = 5

#ODI
$ODI_OVERS = 3

#T20
$T20_OVERS = 2

# start_details
module GetTeamDetails

  def get_team_details
    f= File.open("playing_eleven.rb", "r+") if File.exist?("playing_eleven.rb")
    f.rewind
    lines = f.readlines
    lines.length
    @teams = nil
    for i in 0...lines.length
      @teams = lines[0].split(',')
    end
    f.close
  end


  def get_first_team
    f= File.open("playing_eleven.rb", "r+") if File.exist?("playing_eleven.rb")
    f.rewind
    lines = f.readlines
    lines.length
    @teams = nil
    @first_team = nil
    @second_team = nil
    for i in 0...lines.length
      @first_team = lines[1].split(',')
    end
    f.close
  end

  def get_second_team
    f= File.open("playing_eleven.rb", "r+") if File.exist?("playing_eleven.rb")
    f.rewind
    lines = f.readlines
    lines.length
    @second_team = nil

    for i in 0...lines.length
      @second_team = lines[2].split(',')
    end

    f.close
  end

end