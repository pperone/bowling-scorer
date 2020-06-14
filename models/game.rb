# frozen_string_literal: true

class Game
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  attr_reader :player_1, :player_2
end
