$COIN = ['Heads','Tails']
$OUT = ['Bowled','Run out', 'Stumping', 'Catch out']
# TEST
$TEST_OVERS = 10

# ODI
$ODI_OVERS = 8

# T20
$T20_OVERS = 5

# TOTAL_PLAYERS in each team
$TOTAL_PLAYERS = 11

# start_details
module GetTeamDetails

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

end
