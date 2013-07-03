require 'spec_helper'

describe Spree::Wizard do
  it { should have_many :wizard_taxons }
  it { should have_many :taxons }
end
