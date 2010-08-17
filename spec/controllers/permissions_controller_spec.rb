require 'spec_helper'

describe PermissionsController do

  def mock_permission(stubs={})
    @mock_permission ||= mock_model(Permission, stubs)
  end

  describe "GET index" do
    it "assigns all permissions as @permissions" do
      Permission.stub(:find).with(:all).and_return([mock_permission])
      get :index
      assigns[:permissions].should == [mock_permission]
    end
  end

  describe "GET show" do
    it "assigns the requested permission as @permission" do
      Permission.stub(:find).with("37").and_return(mock_permission)
      get :show, :id => "37"
      assigns[:permission].should equal(mock_permission)
    end
  end

  describe "GET new" do
    it "assigns a new permission as @permission" do
      Permission.stub(:new).and_return(mock_permission)
      get :new
      assigns[:permission].should equal(mock_permission)
    end
  end

  describe "GET edit" do
    it "assigns the requested permission as @permission" do
      Permission.stub(:find).with("37").and_return(mock_permission)
      get :edit, :id => "37"
      assigns[:permission].should equal(mock_permission)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created permission as @permission" do
        Permission.stub(:new).with({'these' => 'params'}).and_return(mock_permission(:save => true))
        post :create, :permission => {:these => 'params'}
        assigns[:permission].should equal(mock_permission)
      end

      it "redirects to the created permission" do
        Permission.stub(:new).and_return(mock_permission(:save => true))
        post :create, :permission => {}
        response.should redirect_to(permission_url(mock_permission))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved permission as @permission" do
        Permission.stub(:new).with({'these' => 'params'}).and_return(mock_permission(:save => false))
        post :create, :permission => {:these => 'params'}
        assigns[:permission].should equal(mock_permission)
      end

      it "re-renders the 'new' template" do
        Permission.stub(:new).and_return(mock_permission(:save => false))
        post :create, :permission => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested permission" do
        Permission.should_receive(:find).with("37").and_return(mock_permission)
        mock_permission.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :permission => {:these => 'params'}
      end

      it "assigns the requested permission as @permission" do
        Permission.stub(:find).and_return(mock_permission(:update_attributes => true))
        put :update, :id => "1"
        assigns[:permission].should equal(mock_permission)
      end

      it "redirects to the permission" do
        Permission.stub(:find).and_return(mock_permission(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(permission_url(mock_permission))
      end
    end

    describe "with invalid params" do
      it "updates the requested permission" do
        Permission.should_receive(:find).with("37").and_return(mock_permission)
        mock_permission.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :permission => {:these => 'params'}
      end

      it "assigns the permission as @permission" do
        Permission.stub(:find).and_return(mock_permission(:update_attributes => false))
        put :update, :id => "1"
        assigns[:permission].should equal(mock_permission)
      end

      it "re-renders the 'edit' template" do
        Permission.stub(:find).and_return(mock_permission(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested permission" do
      Permission.should_receive(:find).with("37").and_return(mock_permission)
      mock_permission.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the permissions list" do
      Permission.stub(:find).and_return(mock_permission(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(permissions_url)
    end
  end

end
