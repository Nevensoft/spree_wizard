# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_wizard'
  s.version     = '2.0.0'
  s.summary     = 'Spree multi product selelction wizard forms'
  s.description = 'Spree multi product selelction wizard forms'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'weston platter'
  s.email     = 'westonplatter@gmail.com'
  s.homepage  = 'http://westonplatter.com'

  s.files        = `git ls-files`.split("\n")
  s.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree', '~> 2.0.0'
  s.add_dependency 'ejs'
  s.add_dependency 'rabl'
  s.add_dependency 'marionette-rails'
  s.add_dependency 'railsy_backbone', '0.0.2'

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
end
