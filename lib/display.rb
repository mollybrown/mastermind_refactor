class Display

  def startup_graphic
		puts
		puts		" _____  _____  _____  _____  _____  _____  _____  _____  _____  ____  "
		puts		"|     ||  _  ||   __||_   _||   __|| __  ||     ||     ||   | ||    \ "
		puts		"| | | ||     ||__   |  | |  |   __||    -|| | | ||-   -|| | | ||  |  |"
		puts		"|_|_|_||__|__||_____|  |_|  |_____||__|__||_|_|_||_____||_|___||____/ "
		puts
  end

  def instructions
  	puts
  	puts "***************************************************************************"
  	puts "                          MASTERMIND INSTRUCTIONS"
  	puts "***************************************************************************"
  	puts
  	puts "                      Welcome to Mastermind, The Game"
  	puts
  	puts "                      MISSION: BREAK THE SECRET CODE"
  	puts
  	puts "The secret code is made up of four elements: Red, Green, Blue, and Yellow."
  	puts
  	puts "The four elements can appear in any order, up to four times. You have an"
  	puts "unlimited number of guesses. Each time you make a guess without cracking"
  	puts "code, you will recieve two hints."
  	puts
  	puts "One hint will give you the number of correct color elements in your guess."
  	puts
  	puts "Another hint will give you the number of correctly positioned/ordered"
  	puts "color elements in your guess."
  	puts
  	puts "For example, if you guess 'RRGY' and the secret code is 'RRRR',"
  	puts "then you will recieve feedback telling you that you have one color correct,"
  	puts "and two positions correct."
  	puts
  	puts "Exit the game at any time by typing 'q' or 'quit'."
  	puts
  	puts "Be a cheater and reveal the secret code by typing 'c' or 'cheat'."
  	puts
  	puts "                              GOOD LUCK!"
  	puts
  	puts "*************************************************************************"
  	puts
  end

  def end_game(secret_code, guesses, game_time)
    puts "-----------------------------------------------------------------------------------------------------------------"
		puts "CONGRATULATIONS! You guessed the sequence '#{secret_code.join.upcase}' in #{guesses} guesses over #{game_time}."
		puts "-----------------------------------------------------------------------------------------------------------------"
		puts
  end

  def goodbye
    puts "Goodbye and thank you for playing!"
  end

  def invalid_option
    puts "Please select a valid option..."
  end

  def invalid_guess
    puts "Please input a valid guess using (r)ed, (g)reen, (b)lue, and (y)ellow ONLY. Try again."
    print "> "
  end

  def startup_prompt
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
		print "> "
  end

  def main_game_prompt
  	puts "I have generated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow."
  	puts "What's your guess?"
    print "> "
  end

  def color_position_feedback(response, correct_colors, correct_positions)
    puts "'#{response.upcase}' has #{correct_colors} correct colors in #{correct_positions} correct positions."
  end

  def guess_loop_feedback(guesses)
    puts "You've taken #{guesses} guess(es). Guess again..."
    print "> "
  end

  def cheat_code(secret_code)
    puts "SECRET CODE: '#{secret_code.join.upcase}' ya filthy cheater. What's your next guess?"
    print "> "
  end

  def play_again
    puts "Do you want to (p)lay again or (q)uit?"
    print "> "
  end

  def guess_too_short
    puts "Too short. You must input exactly 4 letters. Please try again."
    print "> "
  end

  def guess_too_long
    puts "Too long. You must input exactly 4 letters. Please try again."
    print "> "
  end

end
