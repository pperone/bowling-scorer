# frozen_string_literal: true

class Scoreboard
  def initialize(player, scores)
    @player = player.name
    @scores = scores
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
    totals = []

    scores.each do |s|
      
    end

    totals
  end

  attr_reader :player, :scores
end
