require './lib/code_generator'
require './lib/display'
require './lib/game_timer'
require './lib/guess_validator'

class Game

	include CodeGenerator
	include GameTimer

	attr_reader :secret_code,
							:game_over,
							:display,
							:correct_colors,
							:correct_positions,
							:validate_guess,
							:guesses

	def initialize
		@secret_code = CodeGenerator.generate_secret_code
		@validate_guess = GuessValidator.new
		@display = Display.new
		@correct_positions = 0
		@correct_colors = 0
		@guesses = 0
		@game_over = false
	end

	def game_play_loop(response)
		check_for_valid_guess(response)
		if response == 'q' || response == 'quit'
			exit_game
		elsif response == 'c' || response == 'cheat'
			display.cheat_code(secret_code)
		elsif	response == 'i' || response == 'instructions'
			display.instructions
			display.main_game_prompt
		end
	end

	def play_mastermind
		@start_time = Time.now
		display.main_game_prompt
		until game_over == true
			response = gets.chomp.downcase
			game_play_loop(response)

		end
	end

	def check_for_valid_guess(response)
		validate_guess.check_for_invalid_guess(response)
		if validate_guess.valid_guess == true
			@guesses += 1
		  check_response_for_secret_code_match(response)
		end
	end

	def check_response_for_secret_code_match(response)
		if response == secret_code.join
			game_over = true
			game_win(response)
		else
			guess_feedback(response,secret_code)
		end
	end

	def guess_position_checker(response,secret_code)
		guess_array = response.scan(/\w/)
		guess_array.zip(secret_code).map do |a, b|
			@correct_positions += 1 if a == b
		end
		@correct_positions
	end

  def guess_color_checker(response,secret_code)
	  response.chars.each_index do |index|
    @correct_colors += 1 if response[index] == secret_code[index]
	  end
	  @correct_colors
  end

	def reset_correct_color_and_position_count
		@correct_positions = 0
		@correct_colors = 0
	end

	def reset_secret_code_and_all_counts
		@secret_code = CodeGenerator.generate_secret_code
		@correct_positions = 0
		@correct_colors = 0
		@guesses = 0
	end

	def guess_feedback(response,secret_code)
		correct_positions = guess_position_checker(response,@secret_code)
		correct_colors = guess_color_checker(response,@secret_code)
		display.color_position_feedback(response, correct_colors, correct_positions)
		display.guess_loop_feedback(guesses)
		reset_correct_color_and_position_count
	end

	def play_again_option(response=nil)
		until response == 'p' || response == 'play' || response == 'q' || response == 'quit'
		display.play_again
		response = gets.chomp.downcase
			if response == 'p' || response == 'play'
				reset_secret_code_and_all_counts
		 		play_mastermind
		 	elsif response == 'q' || response == 'quit'
				exit_game
			else
				display.invalid_option
			end
		end
	end

	def exit_game
	  display.goodbye
	  exit
	end

	def game_win(response)
		@stop_time = Time.now
    game_time = GameTimer.calculate_game_time(@start_time, @stop_time)
    display.end_game(secret_code, guesses, game_time)
		play_again_option
	end

end
