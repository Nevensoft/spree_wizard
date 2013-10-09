require 'spec_helper'

describe Spree::WizardTaxon do 
  it { should belong_to :wizard }
  it { should belong_to :taxon }
  
  describe '#validate_sku_is_unqiue' do 
    it 'when 0 variants' do 
      wizard_taxon = FactoryGirl.create(:wizard_taxon)
      Spree::Variant.stub(:where).and_return([])

      wizard_taxon.sku = "abc"
      wizard_taxon.save
      wizard_taxon.errors[:sku].should be_present
    end
    
    it 'when 1 variant' do 
      wizard_taxon = FactoryGirl.create(:wizard_taxon)
      Spree::Variant.stub(:where).and_return(["1"])
      
      wizard_taxon.sku = "abc"
      wizard_taxon.save
      wizard_taxon.errors.should be_blank
    end
    
    it 'when 2 variants' do 
      wizard_taxon = FactoryGirl.create(:wizard_taxon)
      Spree::Variant.stub(:where).and_return(["1", "2"])
      
      wizard_taxon.sku = "abc"
      wizard_taxon.save
      wizard_taxon.errors.should be_present
    end
    
    it 'when 3 variants' do 
      wizard_taxon = FactoryGirl.create(:wizard_taxon)
      Spree::Variant.stub(:where).and_return(["1", "2", "3"])
      
      wizard_taxon.sku = "abc"
      wizard_taxon.save
      wizard_taxon.errors.should be_present
    end
  end
  
end
