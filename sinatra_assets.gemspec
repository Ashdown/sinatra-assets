# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sinatra_assets/version'

Gem::Specification.new do |gem|
  gem.name          = 'sinatra_assets'
  gem.version       = SinatraAssets::VERSION
  gem.authors       = ['Rory Devane']
  gem.email         = %w(rory.devane@gmail.com)
  gem.description   = %q{sinatra assets}
  gem.summary       = %q{sharable assets for a sinatra app}
  gem.homepage      = ''

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w(lib)

  gem.add_dependency('sass', '~> 3.3')
  gem.add_dependency('thor')

  gem.add_development_dependency('aruba', '~> 0.4')
  gem.add_development_dependency('rake')
end