require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_validator.rb'

class TestGuessValidator < Minitest::Test

  attr_reader :guess_validator

  def setup
    @guess_validator = GuessValidator.new
  end

  def test_invalid_guess_is_invalid
    guess_validator.check_for_invalid_guess("p")
    refute guess_validator.valid_guess
  end

  def test_valid_guess_is_valid
    guess_validator.check_for_invalid_guess("RGRR")
    assert guess_validator.valid_guess
  end

  def test_valid_guess_is_case_insensitive
    guess_validator.check_for_invalid_guess("RgRr")
    assert guess_validator.valid_guess
  end

  def test_vaild_guess_has_four_letters
    guess_validator.check_for_correct_guess_length("ryry")
    assert guess_validator.valid_guess
  end

  def test_guess_less_than_four_characters_is_invalid
    guess_validator.check_for_correct_guess_length("ryr")
    refute guess_validator.valid_guess
  end

  def test_guess_more_than_four_characters_is_invalid
    guess_validator.check_for_correct_guess_length("ryryr")
    refute guess_validator.valid_guess
  end

  def test_guess_only_includes_letters
    guess_validator.check_for_letters_only("r*ry")
    refute guess_validator.valid_guess
  end

end
