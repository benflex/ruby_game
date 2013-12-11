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
  
    def move_left
      @abs -= @speed unless @abs <= 10
    end
    
    def move_right
      @abs += @speed unless @abs >= WIDTH - 10
    end
    
    def move_up
      @ord -= @speed unless @ord <= 10
    end
    
    def move_down
      @ord += @speed unless @ord >= HEIGHT - 10
    end
  end
end