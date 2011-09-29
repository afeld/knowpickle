require "spec_helper"

describe ReviewsController do
  describe "routing" do

    it "recognizes and generates #create" do
      { :post => "/reviews" }.should route_to(:controller => "reviews", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/reviews/1" }.should route_to(:controller => "reviews", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/reviews/1" }.should route_to(:controller => "reviews", :action => "destroy", :id => "1")
    end

  end
end
