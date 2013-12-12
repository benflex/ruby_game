require_relative 'moving_object.rb'

module RubyGame
  class Monster < MovingObject
    
    attr_accessor :abs, :ord
    
    @@profiles = {}
    
    def initialize()
      @abs = 0
      @ord = 0
      @imgname = ["cactuar", "player", "ghost2", "undead"].sample
      #@speed = speed
      @action = []
    end
    
    Movement = Struct.new(:direction, :speed)
    
    def follow(player, speed = @speed)
      self.move_left(speed) if player.abs < @abs
      self.move_right(speed) if  player.abs > @abs
      self.move_up(speed) if  player.ord < @ord
      self.move_down(speed) if  player.ord > @ord
    end
    
    # plus élégant avec l'opérateur <=>
    # qui retourne 1, 0, ou -1 en fonction du test
    
    def forward(player, speed = @speed)
      @abs += (player.abs <=> @abs) * speed
      @ord += (player.ord <=> @ord) * speed
    end
    
    def scripted_mov()
      dir = @action.first
      self.send(dir.to_s)
    end
    
    def execute(player)
      @action_enum ||= @action.cycle #|| : si l'objet n'existe pas, jle crée
      dir = @action_enum.next
      if dir.direction == :follow
        self.send(:follow, player, dir.speed) 
      elsif dir.direction == :teleport
        self.send(:teleport)
      else
        #dir = @action_enum.next
        #dir = @action_enum.next
        self.send(dir.direction, dir.speed)
      end
    end
    
    def self.define(type, &block)
      m = Monster.new()
      block.call(m)
      @@profiles[type] = m
      #puts @@profiles.inspect
    end
    
    def imgname(imgname)
      @imgname = imgname
    end
    
    def action(action, move)
      move[:speed] ||= @speed
      move[:repeat].times do
        @action << Movement.new(action,move[:speed])
      end
    end
    
    def speed(speed)
      @speed = speed
    end
    
    def repos()
      @abs = rand(0..WIDTH)
      @ord = rand(0..HEIGHT)
    end
    
    def self.build(type)
      m = @@profiles[type].clone
      m.repos
      m
    end
    
  end
end