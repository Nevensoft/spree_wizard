module Spree
  class WizardTaxon < ActiveRecord::Base
    attr_accessible :wizard_id

    belongs_to :wizard
    belongs_to :taxon

  end
end
