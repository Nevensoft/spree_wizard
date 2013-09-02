module Spree
  class Wizard < ActiveRecord::Base
    attr_accessible :name, :taxon_ids, :permalink
    
    has_many :wizard_taxons, order: 'position ASC', class_name: 'Spree::WizardTaxon'
    accepts_nested_attributes_for :wizard_taxons, allow_destroy: true
    attr_accessible :wizard_taxons_attributes
    
    has_many :taxons, through: :wizard_taxons
  end
end
