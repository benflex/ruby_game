require_relative 'static_object.rb'

module RubyGame
  class Player < StaticObject
  
    def initialize(abs, ord, imgname, speed)
      super(abs, ord, imgname)
      @speed = speed
    end
  
    def move_left
      @abs -= @speed unless @abs == 0
    end
    
    def move_right
      @abs += @speed unless @abs == 640
    end
    
    def move_up
      @ord -= @speed unless @ord == 0
    end
    
    def move_down
      @ord += @speed unless @ord == 480
    end
    
    def touch?(ruby)
      @abs <= ruby.abs + 15 && @abs >= ruby.abs - 15  && @ord <= ruby.ord + 15 && @ord >= ruby.ord - 15 
    end
    
  end
end