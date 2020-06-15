require 'minitest/autorun'
require_relative '../models/player.rb'

class TestPlayer < Minitest::Test
  def setup
    @player = Player.new('Joe')
  end

  def test_returns_name
    assert_equal 'Joe', @player.name
  end
end
