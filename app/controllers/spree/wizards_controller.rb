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
      @wizard = Spree::Wizard.includes(:taxons).find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render 'spree/wizards/show_api.json.rabl' }
      end
    end

    # Send back all products and associated variants for a taxon. 
    # Reponse is JSON response for all request types. 
    # Associations are eager loaded.
    #
    # GET /wizards/taxon/1/products
    # 
    def taxon_products
      @taxon = Spree::Taxon.includes(products: [:variants]).find(params[:taxon_id])
      render 'spree/wizards/taxon_products_api.json.rabl'
    end

  end
end