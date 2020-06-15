# frozen_string_literal: true

# Models
require './models/game.rb'
require './models/player.rb'
require './models/scoreboard.rb'

class FormatScoreboard
  def initialize(game:)
    @game = game
  end

  def call
    result = []
    result << header

    game.scoreboards.each do |score|
      result << player(score.player)
      result << pinfalls(score.pinfalls)
      result << score(score.score)
    end

    result
  end

  private

  attr_reader :game

  def header
    "Frame\t  1\t2\t3\t4\t5\t6\t7\t8\t9\t10"
  end

  def player(name)
    "#{name}"
  end

  def pinfalls(pinfalls)
    line = "Pinfalls  "

    pinfalls.each do |p|
      line += "#{p} "
    end

    line
  end

  def score(scores)
    line = "Score\t  "

    scores.each do |s|
      line += "#{s}\t"
    end

    line
  end
end
