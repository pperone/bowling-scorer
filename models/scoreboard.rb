# frozen_string_literal: true

# Models
require './models/player.rb'
require './models/frame.rb'

class Scoreboard
  def initialize(player, scores)
    @player = player.name
    @scores = scores
    @frames = make_frames
  end

  def pinfalls
    pinfalls = []

    frames.each do |f|
      if f.final_frame?
        pinfalls << f.box_1
        pinfalls << f.box_2
        pinfalls << f.box_3
      else
        pinfalls << f.box_1
        pinfalls << f.box_2
        pinfalls << '   '
      end
    end

    pinfalls
  end

  def score
    frames.map(&:total)
  end

  def make_frames
    no_blanks = fill_blanks
    frames    = []
    index     = 0

    while index < no_blanks.length
      if index < 18
        if no_blanks[index] == 'F' && no_blanks[index + 1] == 10
          frames << Frame.new('F', '/')
        elsif no_blanks[index] == 'F'
          frames << Frame.new('F', no_blanks[index + 1])
        elsif no_blanks[index + 1] == 'F'
          frames << Frame.new(no_blanks[index], 'F')
        elsif no_blanks[index + 1] == 'X'
          frames << Frame.new(' ', 'X')
        elsif no_blanks[index] + no_blanks[index + 1] == 10
          frames << Frame.new(no_blanks[index], '/')
        else
          frames << Frame.new(no_blanks[index], no_blanks[index + 1])
        end

        index += 2
      else
        if no_blanks[index + 2] == 0
          frames << Frame.new(no_blanks[index], no_blanks[index +1], ' ')
        else
          frames << Frame.new(no_blanks[index], no_blanks[index +1], no_blanks[index + 2])
        end

        index += 3
      end
    end

    calculate_totals(frames)
  end

  def fill_blanks
    no_blanks = []

    scores.each do |s|
      if s == 'F'
        no_blanks << s
      elsif s.to_i == 10
        if no_blanks.length < 18
          no_blanks << 0
          no_blanks << 'X'
        else
          no_blanks << 'X'
        end
      else
        no_blanks << s.to_i
      end
    end

    if no_blanks.length < 21
      no_blanks << 0
    end

    no_blanks
  end

  def calculate_totals(frames)
    total = 0
    index = 0

    while index < frames.length
      if frames[index].strike?
        if frames[index + 1].strike?
          total += 20 + frames[index + 2].first_throw
          frames[index].total = total
        else
          total += 10 + frames[index + 1].inner_total
          frames[index].total = total
        end
      elsif frames[index].spare?
        total += 10 + frames[index + 1].first_throw
        frames[index].total = total
      else
        total += frames[index].inner_total
        frames[index].total = total
      end

      index += 1
    end

    frames
  end

  attr_reader :player, :scores
  attr_accessor :frames
end
