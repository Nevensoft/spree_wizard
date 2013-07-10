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

    it 'returns json for wizard' do 
      xhr :get, :show, id: @wizard.to_param,
        use_route: 'spree', format: 'json'
      response.body.should == @wizard.to_json
    end
  end

end
