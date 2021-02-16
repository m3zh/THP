require 'bundler'

Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

enemies = []

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
human = HumanPlayer.new(user)
elena = Player.new("Elena")
joe = Player.new("Joe")
enemies << elena
enemies << joe
puts "------------------------".center(60)
puts "#{human.name} is going to fight against".center(60)
puts "the AI players Elena and Joe".center(60)
puts "------------------------".center(60)

while human.life_points > 0

  puts "Pick your action"
  puts "0. Attack Elena"
  puts "1. Attack Joe"
  puts "2. Find a new weapon"
  puts "3. Heal"
  input = gets.chomp
  case input
    when '0'
      if elena.life_points <= 0
        puts "------------".center(60)
        puts "Elena is dead already, nothing done".center(60)
        puts "------------".center(60)
      else
        human.attacks(elena)
      end
    when '1'
      if joe.life_points <= 0
        puts "------------".center(60)
        puts "Joe is dead already, nothing done".center(60)
        puts "------------".center(60)
      else
        human.attacks(joe)
      end
    when '2'
      human.search_weapon
    when '3'
      human.search_health_pack
    else
      puts "------------".center(60)
      puts "Invalid entry, you\'ll miss a turn".center(60)
      puts "------------".center(60)
  end

  puts ""

  enemies.each {|ai|
    if ai.life_points > 0
      ai.attacks(human)
    end
    if human.life_points <= 0
      puts "-----------".center(60)
      puts "xx GAME OVER xx".center(60)
      puts "-----------".center(60)
      exit
    end
  }


  enemies.each { |enemy|
    if enemy.life_points <= 0
      enemies.delete(enemy)
    end
  }


  if enemies.empty?
    puts "------------".center(60)
    puts "** YOU WON **".center(60)
    puts "------------".center(60)
    exit
  else
    human.show_state
    enemies.each {|ai|
      ai.show_state
    }
    puts "------------".center(60)
    puts "The Battle is on".center(60)
    puts "------------".center(60)
  end



end
