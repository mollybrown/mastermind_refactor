require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/game_timer.rb'

class TestGameTimer < Minitest::Test
  def test_minutes_and_seconds_have_proper_format
    timer = GameTimer
    start_time = Time.mktime(2016, 11, 13, 12, 47, 42)
    stop_time = Time.mktime(2016, 11, 13, 12, 50, 11)
    expected = timer.calculate_game_time(start_time,stop_time)
    assert_equal "2 minutes, 29 seconds", expected
  end

  def test_minutes_display_as_zero_when_time_under_one_minute
    timer = GameTimer
    start_time = Time.mktime(2016, 11, 13, 12, 47, 42)
    stop_time = Time.mktime(2016, 11, 13, 12, 47, 59)
    expected = timer.calculate_game_time(start_time,stop_time)
    assert_equal "0 minutes, 17 seconds", expected
  end

end
