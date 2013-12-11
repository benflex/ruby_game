require_relative 'moving_object.rb'

module RubyGame
  class Monster < MovingObject
    
    def initialize(speed)
      @abs = rand(0..WIDTH)
      @ord = rand(0..HEIGHT)
      @imgname = ["cactuar", "player", "ghost2", "undead"].sample
      @speed = speed
    end
    
    def follow(player)
      self.move_left if player.abs < @abs
      self.move_right if  player.abs > @abs
      self.move_up if  player.ord < @ord
      self.move_down if  player.ord > @ord
    end
    
    # plus élégant avec l'opérateur <=>
    # qui retourne 1, 0, ou -1 en fonction du test
    
    def forward(player, speed = @speed)
      @abs += (player.abs <=> @abs) * speed
      @ord += (player.ord <=> @ord) * speed
    end
    
  end
end