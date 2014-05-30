# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "spree_retailers"
  s.version     = '1.1.0'
  s.summary     = %q{Spree Retailers is a Spree extension for listing your company's retail stores on your web site.}

  s.authors     = ["Spencer Steffen", 'Michael Bianco']
  s.email       = ["spencer@citrusme.com", 'mike@cliffsidemedia.com']
  s.homepage    = "http://github.com/citrus/spree_retailers"

  s.require_path = 'lib'
  s.requirements << 'none'


  s.add_dependency 'spree_core', '~> 2.0.0'
  s.add_dependency 'geokit',     '~> 1.8.4'
  s.add_dependency 'geokit-rails'

  s.add_development_dependency 'capybara', '~> 2.0'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
