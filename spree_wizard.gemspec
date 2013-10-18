# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_wizard'
  s.version     = '2.1.0'
  s.summary     = 'Spree multi product selelction wizard forms'
  s.description = 'Spree multi product selelction wizard forms'
  s.author      = ['weston platter','dustin platte']
  s.email       = ['weston@think602.com', 'dustin@think602.com']
  s.homepage    = 'http://github.com/think602/spree_wizard'
  s.license     = 'BSD-3'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'spree_api', '~> 2.1.0'
  s.add_dependency 'spree_backend', '~> 2.1.0'
  s.add_dependency 'spree_core', '~> 2.1.0'
  s.add_dependency 'spree_frontend', '~> 2.1.0'
  s.add_dependency 'ejs'
  s.add_dependency 'rabl'
  s.add_dependency 'marionette-rails'
  s.add_dependency 'railsy_backbone', '0.0.4'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner', '<= 1.0.1'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.14'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'shoulda'
  s.add_development_dependency 'bullet'
  s.add_development_dependency 'ruby-growl'
end
