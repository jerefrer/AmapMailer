require "spec_helper"

describe Admin::SubscribersController do
  describe "routing" do

    it "routes to #index" do
      get("/admin/subscribers").should route_to("admin/subscribers#index")
    end

    it "routes to #new" do
      get("/admin/subscribers/new").should route_to("admin/subscribers#new")
    end

    it "routes to #show" do
      get("/admin/subscribers/1").should route_to("admin/subscribers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin/subscribers/1/edit").should route_to("admin/subscribers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin/subscribers").should route_to("admin/subscribers#create")
    end

    it "routes to #update" do
      put("/admin/subscribers/1").should route_to("admin/subscribers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin/subscribers/1").should route_to("admin/subscribers#destroy", :id => "1")
    end

  end
end
