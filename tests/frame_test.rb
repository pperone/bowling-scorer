require 'minitest/autorun'
require_relative '../models/frame.rb'

class TestFrame < Minitest::Test
  def setup
    @frame_strike = Frame.new(' ', 'X')
    @frame_spare  = Frame.new(9, '/')
    @final_frame  = Frame.new('X', 7, 1)
  end

  def test_returns_if_strike
    assert @frame_strike.strike?
    refute @frame_spare.strike?
  end

  def test_returns_if_spare
    refute @frame_strike.spare?
    assert @frame_spare.spare?
  end

  def test_returns_if_final_frame
    refute @frame_strike.final_frame?
    assert @final_frame.final_frame?
  end

  def test_first_throw
    assert_equal 10, @frame_strike.first_throw
    assert_equal 9, @frame_spare.first_throw
    assert_equal 10, @final_frame.first_throw
  end

  def test_second_throw
    assert_equal 0, @frame_strike.second_throw
    assert_equal 1, @frame_spare.second_throw
    assert_equal 7, @final_frame.second_throw
  end

  def test_inner_total
    assert_equal 10, @frame_strike.inner_total
    assert_equal 10, @frame_spare.inner_total
    assert_equal 18, @final_frame.inner_total
  end

  def test_get_value_by_box
    assert_equal 10, @frame_strike.get_value('X')
    assert_equal 0, @frame_strike.get_value('F')
    assert_equal 1, @frame_strike.get_value(1)
  end
end
