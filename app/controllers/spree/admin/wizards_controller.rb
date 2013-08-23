module Spree
  module Admin
    class WizardsController < ResourceController
      # all CRUD behavior is inherited from Spree::ResourceController
      
      def add_taxon
        # variable used to separate multiple new wizard_taxons in HTML name attribute
        # TODO -- totally open to doing this a better way
        @time_stamp = Time.now.to_i.to_s
      end
      
    end
  end
end

