class Game
  attr_accessor :human_player, :enemies

  def initialize(name)
    @enemies = []
    @enemies << Player.new('Cyborg-1')
    @enemies << Player.new('Cyborg-2')
    @enemies << Player.new('Cyborg-3')
    @enemies << Player.new('Cyborg-4')
    @human_player = HumanPlayer.new(name)
  end


  def kill_player(player)
    self.enemies.delete(player)
    #puts "------------".center(60)
    #puts "KO for #{player.name}".center(60)
    #puts "------------".center(60)
  end

  def is_still_ongoing?
    return self.enemies.empty? == false && self.human_player.life_points > 0
  end

  def show_player_state
    self.enemies.each { |cyborg|
      puts "#{cyborg.show_state}"
    }
    puts "#{self.human_player.show_state}"
  end

  def menu
    if self.human_player.life_points > 0
      puts "Pick your action"
      puts "0. Attack AI (random)"
      puts "1. Find a new weapon"
      puts "2. Heal"
    end
  end

  def menu_choice
    user_input = gets.chomp
    case user_input
      when '0'
        enemy = @enemies[rand(@enemies.length)]
        self.human_player.attacks(enemy)
        if enemy.life_points <= 0
            kill_player(enemy)
        end
        if self.enemies.empty?
          end_game
        end
      when '1'
        self.human_player.search_weapon
      when '2'
        self.human_player.search_health_pack
      else
        puts "------------".center(60)
        puts "Invalid entry, you\'ll miss a turn".center(60)
        puts "------------".center(60)
    end
  end

  def enemy_attacks
    self.enemies.each { |cyborg|
      cyborg.attacks(self.human_player)
    if self.human_player.life_points <= 0
       end_game
    end
    }
  end

  def end_game
    if self.enemies.empty?
      puts "-----------".center(60)
      puts "ALL CYBORGS ARE DEAD".center(60)
      puts "** YOU WON **".center(60)
      puts "-----------".center(60)
      exit
    else
      puts "-----------".center(60)
      puts "YOU ARE DEAD".center(60)
      puts "xx GAME OVER xx".center(60)
      puts "-----------".center(60)
      exit
    end
  end

end
