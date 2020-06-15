# frozen_string_literal: true

# Models
require './models/game.rb'
require './models/player.rb'
require './models/scoreboard.rb'

class FormatScoreboard
  def initialize(game: game)
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
    'Frame    1   2   3   4   5   6   7   8   9   10'
  end

  def player(name)
    "#{name}\n"
  end

  def pinfalls(pinfalls)
    line = 'Pinfalls  '

    pinfalls.each do |p|
      line += "#{p} "
    end
  end

  def score(scores)
    line = 'Score    '

    scores.each do |s|
      line += "#{s}   "
    end
  end
end
