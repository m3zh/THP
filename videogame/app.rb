require 'bundler'
Bundler.require

require_relative 'lib/player'
#require_relative 'lib/game'

elena = Player.new("Elena")
joe = Player.new("Joe")


while elena.life_points > 0 && joe.life_points > 0

    puts "Voici l'état de chaque jouer"
    elena.show_state
    joe.show_state

    puts ""

    puts "Passons à la phase attaque"
    if elena.life_points > 0
      elena.attacks(joe)
    end
    if joe.life_points > 0
      joe.attacks(elena)
    end

    puts ""

end
