lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake_assets/version'

Gem::Specification.new do |gem|
  gem.name          = 'rake-assets'
  gem.date          = '2012-09-22'
  gem.version       = RakeAssets::VERSION
  gem.authors       = ['Nick Barth']
  gem.email         = ['nick@nickbarth.ca']
  gem.summary       = 'A Ruby Gem for compiling assets.'
  gem.description   = 'RakeAssets is a small Ruby Gem that contains some simple configurable Rake Tasks and dependancies for making compiling assets faster and easier.'
  gem.homepage      = 'https://github.com/nickbarth/RakeAssets'

  gem.add_dependency('rake')
  gem.add_dependency('sass')
  gem.add_dependency('coffee-script')
  gem.add_dependency('sprockets')
  gem.add_dependency('yui-compressor')
  gem.add_dependency('uglifier')
  gem.add_development_dependency('rspec')

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep /spec/
  gem.require_paths = ['lib']
end
