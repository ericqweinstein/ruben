Gem::Specification.new do |gem|
  gem.name        = 'ruben'
  gem.version     = '1.1.0'
  gem.authors     = ['Eric Weinstein']
  gem.email       = %w(eric.q.weinstein@gmail.com)
  gem.homepage    = 'http://github.com/ericqweinstein/ruben'
  gem.date        = %q{2014-06-23}
  gem.description = 'Ruben is an IRC chat bot written in Ruby. He is inspired, in part, by Hubot, his CoffeeScript brother from another mother.'
  gem.summary     = 'An extensible IRC chat bot.'
  gem.files       = Dir.glob('{bin,lib}/**/*') + %w(LICENSE README.md Rakefile lib/ spec/ bin/)
  gem.executables << 'ruben'
end
