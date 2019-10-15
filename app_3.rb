require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "----------------------------------------"
puts "|        Bienvenue sur ce jeu           |"
puts "| Le but sera de battre tes adversaires |"
puts "----------------------------------------"

puts "Enregistre ton prénom :"
name = gets.chomp

my_game = Game.new(name)

while my_game.is_still_ongoing?
  my_game.menu
  my_game.menu_choice
  my_game.show_players
  my_game.enemies_attack
  my_game.show_players
end
my_game.end

binding.pry