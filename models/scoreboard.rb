# frozen_string_literal: true

class Scoreboard
  def initialize(player, scores)
    @player = player.name
    @scores = scores
    @frames = []
  end

  def pinfalls
    pinfalls = []

    scores.each do |s|
      if s == 'F'
        pinfalls << s
      elsif s.to_i == 10
        pinfalls << ' '
        pinfalls << 'X'
      else
        pinfalls << s  
      end
    end

    pinfalls
  end

  def score
    ints   = []
    totals = []

    scores.each { |s| ints << s.to_i }

    ints.each_with_index do |int, index|
      if int == 10
        totals << int + ints[index + 1] + ints[index + 2]

    end

    totals
  end

  def make_frames
    
  end

  def only_numbers
    only_numbers = []

    scores.each do |s|
      if s.to_i == 10
        only_numbers << 0
        only_numbers << 10
      else
        only_numbers << s.to_i
      end
    end

    only_numbers
  end

  attr_reader :player, :scores
  attr_accessor :frames
end
