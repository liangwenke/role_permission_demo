require 'spec_helper'

describe PermissionLinesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/permission_lines" }.should route_to(:controller => "permission_lines", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/permission_lines/new" }.should route_to(:controller => "permission_lines", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/permission_lines/1" }.should route_to(:controller => "permission_lines", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/permission_lines/1/edit" }.should route_to(:controller => "permission_lines", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/permission_lines" }.should route_to(:controller => "permission_lines", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/permission_lines/1" }.should route_to(:controller => "permission_lines", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/permission_lines/1" }.should route_to(:controller => "permission_lines", :action => "destroy", :id => "1") 
    end
  end
end
