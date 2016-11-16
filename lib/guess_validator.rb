require './lib/display'
require 'pry'

class GuessValidator

  attr_reader :valid_guess,
              :display

  INVALID_GUESSES = ["play","instuctions","quit","cheat","p","i","q","c"]

  def initialize
    @display = Display.new
    @vaild_guess = false
  end

  def check_for_invalid_guess(guess)
    if INVALID_GUESSES.include?(guess)
      @valid_guess = false
    else
      check_for_correct_guess_length(guess)
    end
  end

  def check_for_correct_guess_length(guess)
    if guess.length < 4
  	  display.guess_too_short
  		@valid_guess = false
  	elsif guess.length > 4
  		display.guess_too_long
  	  @valid_guess = false
  	else
  	  check_for_letters_only(guess)
  	end
  end

  def check_for_letters_only(guess)
    if guess.scan(/^[A-z]+$/).empty?
      display.invalid_guess
      @valid_guess = false
    else
      @valid_guess = true
    end
  end

end
