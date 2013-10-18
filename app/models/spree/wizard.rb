module Spree
  class Wizard < ActiveRecord::Base   
    has_many :wizard_taxons, -> { order 'position ASC'}, 
      class_name: 'Spree::WizardTaxon'
      
    accepts_nested_attributes_for :wizard_taxons, allow_destroy: true
    
    has_many :taxons, through: :wizard_taxons
  end
end
