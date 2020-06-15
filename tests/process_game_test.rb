require 'minitest/autorun'
require_relative '../services/process_game.rb'

class TestProcessGame < Minitest::Test
  def setup
    @file = ["Carl 10", "Carl 10", "Carl 10", "Carl 10", "Carl 10", "Carl 10", "Carl 10", "Carl 10", "Carl 10", "Carl 10", "Carl 10", "Carl 10"]
  end

  def test_returns_formatted_scoreboard
    expected = "Frame\t  1\t2\t3\t4\t5\t6\t7\t8\t9\t10"
    result   = ProcessGame.new(file: @file).call

    assert_equal expected, result[0]
  end
end
