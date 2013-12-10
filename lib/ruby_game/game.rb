require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize(ruby, player)
      super(640, 480, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(IMAGES_PATH, 'background.png'), true)
      @font = Gosu::Font.new(self, Gosu::default_font_name, 60)
      @ruby = ruby
      @ruby.init_image(self)
      @player = player
      @player.init_image(self)
    end
    
    def update
      if self.run?
        @player.move_left if button_down? Gosu::Button::KbLeft
        @player.move_right if button_down? Gosu::Button::KbRight
        @player.move_up if button_down? Gosu::Button::KbUp
        @player.move_down if button_down? Gosu::Button::KbDown
        
        self.won! if @player.touch?(@ruby)
      end
    end
    
    def draw
      @background_image.draw(0, 0, 0)
      @font.draw("j00 Roxor!!", 200, 240, 2, 1.0, 1.0, 0xffffff00) if self.won?
      @ruby.draw
      @player.draw
    end
    
    def start!
      @state = :run
      self.show
    end
    
    def run?
      @state == :run
    end  
    
    def won!
      @state = :won
    end
    
    def won?
      @state == :won
    end
  end
end