require 'spree_wizard'

namespace :spree_wizard do 
  desc 'testing and dev data - depends on spree_sample:load'
  task :sample_load => :environment do 
    
    w = Spree::Wizard.find_or_create_by_name('Sample Wizard')
    
    w.permalink = 'sample_wizard'
    
    taxon_ids = Spree::Taxon.where(name: ['Mugs', 'Bags', 'T-Shirts']).map(&:id)
    w.taxon_ids = taxon_ids
    
    w.save
    
    raise "\n
    ============================================================================
    SpreeWizard
    ----------------------------------------------------------------------------
    Did not find Spree's sample data. Did you run these rake tasks?
    
    rake db:seed 
    rake spree_sample:load
    ============================================================================
    \n" if taxon_ids.count != 3
    
  end
end
