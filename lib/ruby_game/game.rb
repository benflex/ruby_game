require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize(ruby)
      super(640, 480, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(IMAGES_PATH, 'background.png'), true)
      @ruby = ruby
      @ruby.init_image(self)
    end
    
    def update
    end
    
    def draw
      @background_image.draw(0, 0, 0)
      @ruby.draw
    end
    
    def start!
      @state = :run
      self.show
    end
  end
end