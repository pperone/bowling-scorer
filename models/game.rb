# frozen_string_literal: true

# Models
require './models/scoreboard.rb'

class Game
  def initialize
    @scoreboards = []
  end

  attr_accessor :scoreboards
end
