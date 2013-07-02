require "spec_helper"

describe WizardsController do
  describe "routing" do

    it "routes to #index" do
      get("/wizards").should route_to("wizards#index")
    end

    it "routes to #new" do
      get("/wizards/new").should route_to("wizards#new")
    end

    it "routes to #show" do
      get("/wizards/1").should route_to("wizards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wizards/1/edit").should route_to("wizards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wizards").should route_to("wizards#create")
    end

    it "routes to #update" do
      put("/wizards/1").should route_to("wizards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wizards/1").should route_to("wizards#destroy", :id => "1")
    end

  end
end
