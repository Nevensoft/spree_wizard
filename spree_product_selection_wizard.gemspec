# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_product_selection_wizard'
  s.version     = '2.0.0'
  s.summary     = 'Wizard step through to select products'
  s.description = 'Flexible Spree::Admin defined wizard step through process to select product groups'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'weston platter'
  s.email     = 'westonplatter@gmail.com'
  s.homepage  = 'http://westonplatter.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.0.0'
  s.add_dependency 'rails-backbone'
  s.add_dependency 'ejs'
  s.add_dependency 'rabl'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'shoulda'
end
