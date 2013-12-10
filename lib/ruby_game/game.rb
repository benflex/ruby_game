require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize
      super(640, 480, false)
      self.caption = "Ruby Game"
      @background_image = Gosu::Image.new(self, File.join(IMAGES_PATH, 'background.png'), true)
      @font = Gosu::Font.new(self, Gosu::default_font_name, 60)
    end
    
    def update
      if self.run?
        @player.move_left if button_down? Gosu::Button::KbLeft
        @player.move_right if button_down? Gosu::Button::KbRight
        @player.move_up if button_down? Gosu::Button::KbUp
        @player.move_down if button_down? Gosu::Button::KbDown
        
        @monster.move_left if @player.abs < @monster.abs
        @monster.move_right if  @player.abs > @monster.abs
        @monster.move_up if  @player.ord < @monster.ord
        @monster.move_down if  @player.ord > @monster.ord
        
        self.won! if @player.touch?(@ruby)
      end
    end
    
    def draw
      @background_image.draw(0, 0, 0)
      @font.draw("j00 Roxor!!", 180, 240, 2, 1.0, 1.0, 0xffffff00) if self.won?
      @ruby.draw
      @player.draw
      @monster.draw
    end
    
    def start!
      yield(self)
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
    
    def player (player)
      @player = player
      @player.init_image(self)
    end
    
    def ruby (ruby)
      @ruby = ruby
      @ruby.init_image(self)
    end
    
    def monster (monster)
      @monster = monster
      @monster.init_image(self)
    end
    
  end
end