module Spree
  class Spree::WizardsController < Spree::BaseController

    # helper methods that are located in the spree layout view code
    # 
    helper Spree::StoreHelper
    helper Spree::BaseHelper
    include Spree::Core::ControllerHelpers::Order


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
      @wizard = Spree::Wizard.find(params[:id])

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @wizard }
      end
    end


  end
end
