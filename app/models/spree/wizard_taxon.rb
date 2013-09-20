module Spree
  class WizardTaxon < ActiveRecord::Base
    attr_accessible :wizard_id, :taxon_id, :position, :variant_id

    belongs_to :wizard
    belongs_to :taxon
    belongs_to :variant

  end
end
