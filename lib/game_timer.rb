module GameTimer

  def self.calculate_game_time(start_time, stop_time)
  	time_elapsed = stop_time - start_time
    minutes = time_elapsed.to_i / 60
    seconds = time_elapsed.to_i % 60
    "#{minutes} minutes, #{seconds} seconds"
  end

end
