# frozen_string_literal: true

# Models
require './models/game.rb'
require './models/player.rb'
require './models/scoreboard.rb'

# Services
require './services/format_scoreboard.rb'

class ProcessGame
  def initialize(file: file)
    @file = file
  end

  def call
    game = Game.new

    hashed_plays.each do |k, v|
      player = Player.new(k)
      score  = Scoreboard.new(player, v)

      game.scoreboards << score
    end

    formatted_scoreboard(game)
  end

  private

  attr_reader :file

  def hashed_plays
    file.each_with_object({ }) do |item, result|
      key   = item.split[0]
      value = item.split[1]

      (result[key] ||= [ ]) << value
    end
  end

  def formatted_scoreboard(game)
    FormatScoreboard.new(game: game).call
  end

  def number_of_players
    hashed_plays.size
  end
end
