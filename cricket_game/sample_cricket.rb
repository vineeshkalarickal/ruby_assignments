#Team 1
batting_team = ['Kusal Perera',' Kusal Mendis', 'Dinesh Chandimal (c)',' Angelo Mathews',' Roshen Silva',' Niroshan Dickwella (wk)',' Dilruwan Perera',' Rangana Herath',' Suranga Lakmal',' Lahiru Gamage',' Lahiru Kumara']
#Team 2
t2 = ['Devon Smith',' Kraigg Brathwaite',' Kieran Powell',' Shai Hope',' Roston Chase',' Shane Dowrich (wk)',' Jason Holder (c)',' Devendra Bishoo',' Kemar Roach',' Miguel Cummins',' Shannon Gabriel']
coin = ['Heads','Tails']

def played(batting_team,t2)
	score_card = [1, 4, 4, 2, 6, nil]
	@total = 0
	pos_start = 0
	pos_end = 1

	balls = 0
	players = batting_team[pos_start..pos_end]
	6.times do |i|
		players.each do |a|

		  ball = score_card.shuffle.first
		  if ball == nil
		    puts "#{a} gets out"
		    batting_team.delete(a)
		    puts "Players remaining are #{batting_team.count}"
		    players = batting_team[pos_start..pos_end]
			  puts "Innings end \n\n\n" if batting_team == []
			  puts "Total runs scored #{@total} \n\n\n" if batting_team == []
		  	puts "New player came to bat #{players}" if players && players.any?
		  	abort("Innings ended with total runs of #{@total}") if players == nil
		  else
		    puts "#{a} hits a #{ball} runs"
		    @total = @total + ball
		    abort("Innings ended with total runs of #{@total}") if i == 6
		  end

		  balls = balls + 1
		  puts "Total runs after this over #{@total} \n\n\n" if balls % 6 == 0
		end
	end
	return @total
end

puts "Teams are Srilanka and WestIndies \n\n "

puts "Playing XI for Srilanka are #{batting_team.join(",")} \n\n  "
sleep 2
puts "Playing XI for WestIndies #{t2.join(",")} \n\n "
sleep 2

puts "Coin Tossed"
if coin.shuffle.first == 'Heads'
	puts "Srilanka won the toss and selected to bat first"
	puts "Match Starts"
	played(batting_team,t2)
	firstTotal = @total
	puts "Total runs by Srilanka #{firstTotal}"
	sleep 2
	puts "Now WestIndies will come to bat"
	played(t2,batting_team)
	secondTotal = @total
	puts "Total runs by WestIndies #{secondTotal}"
	if firstTotal > secondTotal
		puts "Srilanka won the match by #{firstTotal - secondTotal} runs"
	else
		puts "WestIndies won the match by #{secondTotal - firstTotal} runs"
	end
else
	puts "WestIndies won the toss and selected to bat first"
	puts "Match Starts"
	played(t2,batting_team)
	firstTotal = @total
	puts "Total runs by WestIndies #{firstTotal}"
	sleep 2
	puts "Now Srilanka will come to bat"
	played(batting_team,t2)
	secondTotal = @total
	puts "Total runs by WestIndies #{secondTotal}"
	if firstTotal > secondTotal
		puts "WestIndies won the match by #{firstTotal - secondTotal} runs"
	else
		puts "Srilanka won the match by #{secondTotal - firstTotal} runs"
	end
end
