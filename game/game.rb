require_relative 'player'

class Game

  def initialize
    @players = [Player.new('BobbaFett'), Player.new('Luke Skywalker'), Player.new('Princess Leia'), Player.new('Kylo Ren')].shuffle
    @round = 1
  end

  def game_status

    puts "---------------"
    puts "  Game Status  "
    puts "---------------"
    @players.each do |player|
      puts "#{player.name} HP: #{player.dead? ? 'DEAD' : player.hp}"
    end

  end

  # def alive_players
  #   @players.select{}
  # end

  def game_over?
    alive_players.count == 1
  end

  def alive_players
    @players.select{|player| player.hp > 0}
  end

  def get_ennemy_jedi(current)
    alive_players.select{|player| player != current}.sample
  end

  def next_round
      @round+=1 -
      @players.rotate!
      sleep 1
  end

  def run
    
    while(!game_over?) 
      current_jedi = alive_players.first
      ennemy_jedi = get_ennemy_jedi(current_jedi)

      puts '---------------'
      puts "     Round##{@round}"
      puts '---------------'

      current_jedi.attacks(ennemy_jedi)
      
      game_status

      next_round

    end

    puts "#{alive_players.first.name} Won!!!"

  end

end