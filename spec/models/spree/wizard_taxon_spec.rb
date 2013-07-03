require 'spec_helper'

describe Spree::WizardTaxon do 
  it { should belong_to :wizard }
  it { should belong_to :taxon }
end