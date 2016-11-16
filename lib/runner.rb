require './lib/display'
require './lib/game'

class Runner

	attr_reader :display

	def initialize
		@display = Display.new
	end

	def display_startup_graphic
		display.startup_graphic
		startup_menu
	end

	def startup_menu
		display.startup_prompt
		game_flow_loop
	end

	def game_flow_loop
		response = gets.chomp.downcase
		if response == "q" || response == "quit"
			display.goodbye
			exit
		elsif response == "i" || response == "instructions"
			display.instructions
		elsif response == "p"	|| response == "play"
			start_game
		else
			display.invalid_option
		end
		startup_menu
	end

	def start_game
		Game.new.play_mastermind
	end

end

# mm = Runner.new
# mm.display_startup_graphic
