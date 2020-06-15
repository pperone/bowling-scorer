# Libraries
require 'readline'

# Services
require './services/process_game.rb'

puts 'Enter file path:'

input  = Readline.readline('> ', true)
file   = File.readlines(input)
result = ProcessGame.new(file: file).call

result.each { |line| puts line }
exit!
