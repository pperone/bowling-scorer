# Libraries
require 'readline'

# Services
require './services/process_game.rb'

puts 'Enter file path:'

input  = Readline.readline('> ', true)
file   = File.read(input).split('\n')
result = ProcessGame.new(file: file).call

puts result
exit!
