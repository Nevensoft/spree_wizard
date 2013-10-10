module Spree
  module WizardsHelper
    
    def wizard_preselected_variants_path(wizard)
      params = preselected_params(wizard)
      wizard_path(wizard, params)
    end
    
    def wizard_preselected_variants_url(wizard)
      params = preselected_params(wizard) 
      wizard_url(wizard, params)
    end
    
    def preselected_params(wizard)
      params_hash = {}
      wizard.wizard_taxons.each_with_index do |wizard_taxon, index|
        params_hash["step#{index+1}"] = wizard_taxon.sku unless wizard_taxon.sku.blank?
      end
      params_hash
    end
    
  end
end
