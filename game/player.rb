class Player

  attr_reader :name, :ap
  attr_accessor :hp

  def initialize(name)
    @name=name
    @hp=20
    @ap=10
  end

  def dead?
    @hp <= 0
  end

  def attacks(ennemy)
    puts "#{@name} attacks #{ennemy.name}"
    damage_points = rand(@ap) + 1
    puts "#{ennemy.name} takes #{damage_points} points of damage!"
    ennemy.hp -= damage_points
  end






end