module RubyGame
  class StaticObject
    attr_accessor :abs, :ord, :imgname
    
    def initialize(abs, ord, imgname)
      @abs = abs
      @ord = ord
      @imgname = imgname
    end
    
    def init_image(window)
      @img = Gosu::Image.new(window, File.join(IMAGES_PATH, "#{@imgname}.png"), true)
    end
    
    def draw
      @img.draw_rot(@abs, @ord, 1, 0)
    end
    
  end
end
  