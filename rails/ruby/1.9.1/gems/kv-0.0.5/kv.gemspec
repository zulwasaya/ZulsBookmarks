# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kv/version'

Gem::Specification.new do |gem|
  gem.name          = "kv"
  gem.version       = KV::VERSION
  gem.authors       = ["Michael Gorsuch"]
  gem.email         = ["michael.gorsuch@gmail.com"]
  gem.description   = %q{Simple conversion of key=value strings to Hash}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/gorsuch/kv"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rspec')
end
