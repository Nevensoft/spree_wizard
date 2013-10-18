Spree::Taxon.class_eval do 
  has_many :wizard_taxons
  has_many :wizards, through: :wizard_taxons
end
