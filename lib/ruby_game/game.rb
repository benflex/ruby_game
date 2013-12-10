require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize
      super(640, 480, false)
      self.caption = "Ruby Game"
    end
    
    def start!
      @state = :run
      self.show
    end
  end
end