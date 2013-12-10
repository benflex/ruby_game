module RubyGame
  class StaticObject
    attr_accessor :abs, :ord, :imgname
    
    def initialize(abs, ord, imgname)
      @abs = abs
      @ord = ord
      @imgname = imgname
    end
    
    def init_image(window)
      @img = Gosu::Image.new(window, File.join(IMAGES_PATH, @imgname), true)
    end
    
    def draw
      @img.draw(@abs, @ord, 1)
    end
    
  end
end
  