require 'spec_helper'

describe Spree::Wizard do
  it { should have_db_column :name }
  it { should have_db_column :permalink }

  it { should have_many :wizard_taxons }
  it { should have_many :taxons }
end
