module SpreeWizard
  class Engine < Rails::Engine
    require 'spree'
    isolate_namespace Spree
    engine_name 'spree_wizard'
    
    # require these gems here so their js assets get loaded
    require 'railsy_backbone'
    require 'marionette-rails'

    config.autoload_paths += %W(#{config.root}/lib)

    rake_tasks do 
      load 'spree_wizard/railties/sample_load.rake'
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
  end
end
