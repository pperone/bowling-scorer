require 'minitest/autorun'
require_relative '../models/scoreboard.rb'

class TestScoreboard < Minitest::Test
  def setup
    @player     = Player.new('Pete')
    @scoreboard = Scoreboard.new(@player, [10, 9, 1, 10, 'F', 6, 7, 2, 10, 10, 10, 0, 8, 10, 8, 1])
  end

  def test_returns_pinfalls
    expected = [
      " ", "X", "\t", 9, "/", "\t", " ", 
      "X", "\t", "F", 6, "\t", 7, 2, "\t", 
      " ", "X", "\t", " ", "X", "\t", " ", 
      "X", "\t", 0, 8, "\t", "X", 8, 1
    ]

    assert_equal expected, @scoreboard.pinfalls
  end

  def test_returns_score
    expected = [20, 40, 56, 62, 71, 101, 121, 139, 147, 166]

    assert_equal expected, @scoreboard.score
  end
end
