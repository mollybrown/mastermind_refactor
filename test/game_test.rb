require 'minitest/autorun'
require 'minitest/pride'
require './lib/game.rb'

class TestGame < Minitest::Test

attr_reader :game

  def setup
    @game = Game.new
    @validate_guess = GuessValidator.new
  end

  def test_game_begins_with_zero_guesses
    assert_equal 0, game.guesses
  end

  def test_game_begins_with_zero_correct_colors
    assert_equal 0, game.correct_colors
  end

  def test_game_begins_with_zero_correct_positions
    assert_equal 0, game.correct_positions
  end

  def test_valid_guess_increments_guess_counter_by_one
    game.game_play_loop("ryrr")
    game.validate_guess
    assert_equal 1, game.guesses
  end

  def test_two_valid_guesess_increments_guess_counter_by_two
    game.game_play_loop("ryrr")
    game.validate_guess
    game.game_play_loop("bybb")
    game.validate_guess
    assert_equal 2, game.guesses
  end

  def test_invalid_guess_does_not_increment_guess_counter
    game.game_play_loop("ryr")
    game.validate_guess
    assert_equal 0, game.guesses
  end

  def test_postion_checker_returns_number_correct_positions_in_guess
    secret_code = ["r","y","y","y"]
    correct_positions = game.guess_position_checker("rrrr",secret_code)
    assert_equal 1, correct_positions
  end

  def test_color_checker_returns_number_correct_colors_in_guess
    secret_code = ["r","r","y","y"]
    correct_colors = game.guess_color_checker("rrrr",secret_code)
    assert_equal 2, correct_colors
  end

  def test_reset_all_resets_secret_code
    old_secret_code = game.secret_code
    new_secret_code = game.reset_secret_code_and_all_counts
    refute_equal new_secret_code, old_secret_code
  end

  def test_reset_all_resets_correct_colors_and_positions
    game.reset_secret_code_and_all_counts
    assert_equal 0, game.correct_colors
    assert_equal 0, game.correct_positions
  end

end
