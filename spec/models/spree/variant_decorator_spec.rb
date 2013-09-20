require 'spec_helper'

describe Spree::Variant do 
  it { should have_many :wizard_taxons }
end
