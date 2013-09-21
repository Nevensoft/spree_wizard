module Spree
  class WizardsController < Spree::StoreController

    # GET /wizards
    # GET /wizards.json
    def index
      @wizards = Spree::Wizard.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @wizards }
      end
    end

    # Eager load the wizard's taxons
    # GET /wizards/1
    # GET /wizards/1.json
    def show
      @wizard = Spree::Wizard.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render 'spree/wizards/show_api', object: @wizard }
      end
    end
    
    # Same as :show action, but lookup by permalink
    # GET /wizards/1
    # GET /wizards/1.json
    def bundle_show
      @wizard = Spree::Wizard.find_by_permalink(params[:permalink])
      
      respond_to do |format|
        format.html { render 'spree/wizards/show' } 
        format.json { render 'spree/wizards/show_api', object: @wizard }
      end
    end

    # Get taxon and eager load associated objects
    # GET /wizards/taxon/1/products.json
    def taxon_products
      @taxon = Spree::Taxon.find(params[:taxon_id])
      # Completed 200 OK in 34ms (Views: 26.5ms | ActiveRecord: 1.1ms)
      
      # vs
      # 
      # @taxon = Spree::Taxon.includes(products: [variants: [:option_values]]).find(params[:taxon_id])
      # Completed 200 OK in 224ms (Views: 165.6ms | ActiveRecord: 6.0ms)
      
      render 'spree/wizards/taxon_products_api', formats: :json, object: @taxon
    end

  end
end
