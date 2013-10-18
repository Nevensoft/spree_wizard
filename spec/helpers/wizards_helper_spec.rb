require 'spec_helper'

describe Spree::WizardsHelper do
  
  describe '#params_hash' do 
    it 'should be empty' do 
      wizard = FactoryGirl.create(:wizard)
      helper.preselected_params(wizard).should == {}
    end
    
    it 'should have preselected variant sku' do 
      wizard = FactoryGirl.create(:wizard)
      wizard.wizard_taxons.each_with_index do |wt, i|
        wt.sku = "abc-#{i}"
      end
      
      wizard.wizard_taxons.each_with_index do |wt, i|
        helper.preselected_params(wizard)["step#{i+1}"].should == "abc-#{i}"
      end
    end
  end
  
end
