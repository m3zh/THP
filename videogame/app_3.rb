require 'bundler'

Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'


puts ""
puts "------------------------".center(60)
puts "The Game of the Year".center(60)
puts "ILS VEULENT TOUS MA POO' ".center(60)
puts "May the odds be in your favour".center(60)
puts "------------------------".center(60)
puts ""
puts "Pick your player name"
puts ">"
user = gets.chomp
game = Game.new(user)

puts "------------------------".center(60)
puts "#{game.human_player.name} is going to fight against".center(60)
puts "the AI players #{game.enemies.map {|enemy| enemy.name}.join(",") }".center(60)
puts "------------------------".center(60)


while true
  puts "------------".center(60)
  puts "The Battle is on".center(60)
  puts "------------".center(60)


  game.menu
  game.menu_choice
  puts ""
  game.enemy_attacks
  puts ""
  puts "------------".center(60)
  puts ""
  game.show_player_state

end
