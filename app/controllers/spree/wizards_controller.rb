 module Spree
  class Spree::WizardsController < Spree::StoreController

    # GET /wizards
    # GET /wizards.json
    def index
      @wizards = Spree::Wizard.all

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @wizards }
      end
    end

    # GET /wizards/1
    # GET /wizards/1.json
    def show
      @product = Spree::Product.all
      @wizard = Spree::Wizard.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @wizard }
      end
    end


  end
end