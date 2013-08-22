module Spree
  class WizardTaxon < ActiveRecord::Base
    attr_accessible :wizard_id, :taxon_id, :position

    belongs_to :wizard
    belongs_to :taxon

  end
end
