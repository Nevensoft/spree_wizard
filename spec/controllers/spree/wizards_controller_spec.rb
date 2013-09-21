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

    it 'renders rabl template via id lookup' do 
      xhr :get, :show, id: @wizard.to_param,
        use_route: 'spree', format: 'json'
      response.should be_successful
      response.should render_template('spree/wizards/show_api')
    end
  end
  
  describe 'GET #show_bundle' do 
    it 'looks up @wizard by permalink' do
      get :bundle_show, use_route: :spree, permalink: @wizard.permalink
      assigns(:wizard).should eq(@wizard)
      response.should render_template('spree/wizards/show', format: :html)
    end

    it 'renders rabl template via permalink lookup' do 
      xhr :get, :bundle_show, permalink: @wizard.permalink,
        use_route: 'spree', format: 'json'
      response.should be_successful
      response.should render_template('spree/wizards/show_api')
    end
  end

  describe 'GET #taxon_products' do 
    it 'assigns @taxon and @wizard' do 
      taxon = FactoryGirl.build(:taxon)
      Spree::Taxon.stub_chain(:includes, :includes, :find).and_return(taxon)

      xhr :get, :taxon_products, taxon_id: 1, 
        use_route: 'spree', format: 'json'
      
      response.should be_successful
      assigns(:taxon).should eq(taxon)
    end

    it 'renders rabl template' do 
      Spree::Taxon.stub_chain(:includes, :includes,:find).and_return('spree_taxon')

      xhr :get, :taxon_products, taxon_id: 1, 
        use_route: 'spree', format: 'json'

      response.should be_successful
      response.should render_template('spree/wizards/taxon_products_api')
    end
  end
end
