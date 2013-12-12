require_relative 'static_object.rb'

module RubyGame
  class MovingObject < StaticObject
    def initialize(abs, ord, imgname, speed)
      super(abs, ord, imgname)
      @speed = speed
    end
  
    def touch?(object)
      @abs <= object.abs + 15 && @abs >= object.abs - 15  && @ord <= object.ord + 15 && @ord >= object.ord - 15 
    end
  
    def move_left(speed = @speed)
      @abs -= speed unless @abs <= 10
    end
    
    def move_right(speed = @speed)
      @abs += speed unless @abs >= WIDTH - 10
    end
    
    def move_up(speed = @speed)
      @ord -= speed unless @ord <= 10
    end
    
    def move_down(speed = @speed)
      @ord += speed unless @ord >= HEIGHT - 10
    end
    
    def repos()
      @abs = rand(0..WIDTH)
      @ord = rand(0..HEIGHT)
    end
    
    alias_method :teleport, :repos
    
  end
end