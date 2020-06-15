require 'rspec/autorun'
require_relative '../models/player.rb'

describe Player do
  it "return name" do
    player = Player.new('Joe')

    expect(player.name.to_eq('Joe')
  end
end
