require 'spec_helper'

describe Spree::WizardsController do

  before :all do 
    @wizard = FactoryGirl.create(:wizard)
  end

  describe 'GET #index' do
    it 'assigns all wizards as @wizards' do
      get :index, use_route: :spree
      assigns(:wizards).should eq([@wizard])
    end

    it 'returns json list' do 
      xhr :get, :index, 
        use_route: 'spree', format: 'json'
      response.body.should == [@wizard].to_json
    end
  end

  describe 'GET #show' do
    it 'assigns the requested wizard as @wizard' do
      get :show, use_route: :spree, id: @wizard.to_param
      assigns(:wizard).should eq(@wizard)
    end

    it 'renders rabl template' do 
      xhr :get, :show, id: @wizard.to_param,
        use_route: 'spree', format: 'json'
      response.should be_successful
      response.should render_template('spree/wizards/show_api')
    end
  end

  describe 'GET #taxon_products' do 
    it 'assings @taxon and @wizard' do 
      taxon = FactoryGirl.build(:taxon)
      Spree::Taxon.stub_chain(:includes, :find).and_return(taxon)

      xhr :get, :taxon_products, taxon_id: 1, 
        use_route: 'spree', format: 'json'
      
      response.should be_successful
      assigns(:taxon).should eq(taxon)
    end

    it 'renders rabl template' do 
      Spree::Taxon.stub_chain(:includes, :find).and_return('spree_taxon')

      xhr :get, :taxon_products, taxon_id: 1, 
        use_route: 'spree', format: 'json'

      response.should be_successful
      response.should render_template('spree/wizards/taxon_products_api')
    end
  end
end
