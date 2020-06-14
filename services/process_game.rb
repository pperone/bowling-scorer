# frozen_string_literal: true

class ProcessGame
  def initialize(file: file)
    @file = file
  end

  def call
    file
  end

  private

  attr_reader :file

  def format_scoreboard
  end

  def number_of_players
  end
end
