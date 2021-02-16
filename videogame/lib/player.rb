class Player
  attr_accessor :life_points, :name

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} life points"
  end

  def compute_damage
    rand(1..6)
  end

  def gets_damage(num)
    if @life_points - num <= 0
      puts "------------".center(60)
      puts "K.O. ! #{@name} est mort.e X__X ".center(60)
      puts "------------".center(60)
      @life_points = 0
    else
      @life_points -= num
    end
    return @life_points
  end

  def attacks(player)
    num = compute_damage
    puts "#{@name} attacks #{player.name}, avec #{num} points de dommage"
    player.gets_damage(num)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level, :name

  def initialize(name)
    super(name)
    @weapon_level = 1
    @life_points = 100
  end

  def show_state
    puts "#{@name} a #{@life_points} life points et une arme de niveau #{@weapon_level}"
  end

  def search_weapon
    dice = rand(1..6)
    if dice > @weapon_level
      @weapon_level = dice
      puts "-----------".center(60)
      puts "Tu as trouvé une arme de niveau #{@weapon_level}, youhou!".center(60)
      puts "-----------".center(60)
    else
      puts "-----------".center(60)
      puts "M@*#$ ...c'est une arme chiante, tu ne la prends pas".center(60)
      puts "-----------".center(60)
    end
  end

  def search_health_pack
    dice = rand(1..6)
    if dice == 1
      puts "------------".center(60)
      puts "Tu n'as rien trouvé".center(60)
      puts "------------".center(60)
    elsif dice >= 2 || dice <= 5
      puts "------------".center(60)
      puts "Tu as trouvé un pack de +50 points de vie".center(60)
      puts "------------".center(60)
      if @life_points + 50 > 100
         @life_points = 100
      else
        @life_points += 50
      end
    elsif dice == 6
      puts "------------".center(60)
      puts "Tu as trouvé un pack de +#{80} points de vie".center(60)
      puts "------------".center(60)
      if @life_points + 80 > 100
        @life_points = 100
      else
        @life_points += 80
      end
    end
    return @life_points
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

end
