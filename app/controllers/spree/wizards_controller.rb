module Spree
  class WizardsController < Spree::StoreController

    # GET /wizards
    # GET /wizards.json
    # 
    def index
      @wizards = Spree::Wizard.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @wizards }
      end
    end

    # Eager load the wizard's taxons
    # 
    # GET /wizards/1
    # GET /wizards/1.json
    # 
    def show
      @wizard = Spree::Wizard.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render 'spree/wizards/show_api', object: @wizard }
      end
    end

    # Send back all products and associated variants for a taxon. 
    # Reponse is JSON response for all request types. 
    # Associations are eager loaded.
    #
    # GET /wizards/taxon/1/products
    # 
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
