require 'spec_helper' 

describe Spree::Taxon do 
  it { should have_many :wizard_taxons }
  it { should have_many :wizards }
end