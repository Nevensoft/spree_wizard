Spree::Taxon.class_eval do 

  attr_accessible :wizard_ids

  has_many :wizard_taxons
  has_many :wizards, through: :wizard_taxons
end
