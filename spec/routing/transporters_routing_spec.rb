require "spec_helper"

describe TransportersController do
  describe "routing" do

    it "routes to #index" do
      get("/transporters").should route_to("transporters#index")
    end

    it "routes to #new" do
      get("/transporters/new").should route_to("transporters#new")
    end

    it "routes to #show" do
      get("/transporters/1").should route_to("transporters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/transporters/1/edit").should route_to("transporters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/transporters").should route_to("transporters#create")
    end

    it "routes to #update" do
      put("/transporters/1").should route_to("transporters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transporters/1").should route_to("transporters#destroy", :id => "1")
    end

  end
end
