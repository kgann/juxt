# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'juxt/version'

Gem::Specification.new do |gem|
  gem.name          = "juxt"
  gem.version       = Juxt::VERSION
  gem.authors       = ["Kyle Gann"]
  gem.email         = ["kylegann@gmail.com"]
  gem.description   = %q{A simple gem to provide juxtaposition to Objects and Arrays}
  gem.summary       = %q{A simple gem to provide juxtaposition to Objects and Arrays}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end
