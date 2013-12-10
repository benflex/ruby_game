# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_game/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_game"
  spec.version       = RubyGame::VERSION
  spec.authors       = ["benflex"]
  spec.email         = ["breverend@leadformance.com"]
  spec.description   = %q{Roxor Game}
  spec.summary       = %q{No pew pew but some fun}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  gem.add_runtime_dependency "gosu"
  gem.add_dependency "commander", [">= 4.1.3"]
  gem.add_development_dependency "rspec", ["=2.13.0", "=2.12.0", "=2.6.0"]
end
