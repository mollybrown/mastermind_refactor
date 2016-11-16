require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game.rb'
require_relative '../lib/runner.rb'
require 'pry'

class RunnerTest < Minitest::Test
  def test_it_exists
    assert RunnerTest
  end

  # def test_invalid_response_is_caught
  #   mm = MastermindRunner.new
  #   assert_equal "Please select a valid option", mm.game_loop("d")
  # end

end
