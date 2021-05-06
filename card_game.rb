require './lib/deck'
require './lib/player'
require './lib/game'
require './lib/hand'
require 'pry'

puts "Would you like to start a new game, Yes/No"
#if user selects yes, will procesed with game
Hand.new(gets.chomp)

