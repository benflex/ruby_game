require 'gosu'

module RubyGame
  class Game < Gosu::Window
    def initialize
      super(WIDTH, HEIGHT, false)
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
        
        @monsters.each do |m| 
          #m.follow(@player)
          #m.scripted_mov 
          m.execute
          self.lost! if m.touch?(@player)
        end
        #@monster.forward(@player)
        
        self.won! if @player.touch?(@ruby)
      
      end
    end
    
    def button_down(id)
      #self.close if id == Gosu::Button::KbEspace
      self.restart! if id == Gosu::Button::KbR
    end
    
    def draw
      @background_image.draw(0, 0, 0)
      @font.draw("j00 Roxor!!", 180, 240, 2, 1.0, 1.0, 0xffffff00) if self.won?
      @font.draw("j00 Nubi!!!", 180, 240, 2, 1.0, 1.0, 0xffff0000) if self.lost?
      @ruby.draw
      @player.draw
      @monsters.each  { |m| m.draw }
    end
    
    def start!(&block)
      if block_given? 
        @block = block
      end
      @monsters = []
      instance_eval(&@block)
      #@block.call(self)
      @state = :run
      self.show if block_given?
    end
    
    alias_method :restart!, :start!
    
    def won!
      @state = :won
    end
    
    def lost!
      @state = :lost
    end
    
    %w(run won lost).each do |state|
      define_method "#{state}?" do
        @state == state.to_sym 
      end
    end
    
    %w(player ruby monster).each do |o|
      define_method o do |object|
        instance_variable_set("@#{o}", object)
        instance_variable_get("@#{o}").init_image(self)
      end
    end
    
    def monsters (monsters)
      @monsters += monsters
      @monsters.each { |m| m.init_image(self) }
    end
=begin    
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
=end    
  end
end