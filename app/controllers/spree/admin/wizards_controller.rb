module Spree
  module Admin
    class WizardsController < ResourceController

      # all CRUD behavior is inherited from Spree::ResourceController


      # manual overrides

        def update
          if params[:wizard][:taxon_ids].present?
            params[:wizard][:taxon_ids] = params[:wizard][:taxon_ids].split(',')
          end
          super
        end

    end
  end
end

