module Spree
  class WizardTaxon < ActiveRecord::Base
    attr_accessible :wizard_id, 
      :taxon_id, 
      :position, 
      :sku

    belongs_to :wizard
    belongs_to :taxon
    
    before_save :validate_sku_is_unqiue
    
    def validate_sku_is_unqiue
      return true if sku.blank?
      
      case Variant.where(sku: sku).size
      when 0 
        errors.add(:sku, "No variant found for SKU: #{sku}")
        return false
      when 1 
        return true
      else   
        errors.add(:sku, "2 or more variants found for SKU: #{sku}")
        return false
      end
    end
    
  end
end
