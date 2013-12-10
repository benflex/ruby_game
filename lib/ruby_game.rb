require_relative "ruby_game/version"
require_relative "ruby_game/game"
require_relative "ruby_game/static_object"
require_relative "ruby_game/ruby"
require_relative "ruby_game/player"

module RubyGame
  ROOT_PATH = File.expand_path('../', File.dirname(__FILE__))
  IMAGES_PATH = File.join(ROOT_PATH, '/app/assets/images')
end
