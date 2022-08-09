module ScoreCard

  def show_scorecard(total, over, wickets)
    puts " \n _____ Score: #{total} / #{wickets} [ Overs: #{over} ] ____ \n\n"
  end

  def final_scorecard(total, over, team, innings)
    run_rate = ->(total, over) { (total.to_f/over.to_f).to_f.round(2)}

    return unless [1, 3].include? innings

    puts " Team #{team} requrires Runs: #{total} in #{over} overs"
    puts " Required Run rate #{run_rate.call(total, over)} per over \n\n"
  end

  def show_over_details(balls)
    ball_proc = Proc.new{|balls|
      tot_overs = (balls.to_i / 6).to_i.truncate()
      balls_left = (balls.to_i % 6).to_i + 1

      if balls_left == 6
        tot_overs += 1
        balls_left = 0
      end

      print " ----+ #{tot_overs}.#{balls_left} +---- "
    }
    ball_proc.call(balls)
  end
end