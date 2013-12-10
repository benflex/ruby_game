require_relative 'moving_object.rb'

module RubyGame
  class Player < MovingObject 
    
    def touch?(ruby)
      @abs <= ruby.abs + 15 && @abs >= ruby.abs - 15  && @ord <= ruby.ord + 15 && @ord >= ruby.ord - 15 
    end
    
  end
end