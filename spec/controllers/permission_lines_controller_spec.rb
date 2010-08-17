require 'spec_helper'

describe PermissionLinesController do

  def mock_permission_line(stubs={})
    @mock_permission_line ||= mock_model(PermissionLine, stubs)
  end

  describe "GET index" do
    it "assigns all permission_lines as @permission_lines" do
      PermissionLine.stub(:find).with(:all).and_return([mock_permission_line])
      get :index
      assigns[:permission_lines].should == [mock_permission_line]
    end
  end

  describe "GET show" do
    it "assigns the requested permission_line as @permission_line" do
      PermissionLine.stub(:find).with("37").and_return(mock_permission_line)
      get :show, :id => "37"
      assigns[:permission_line].should equal(mock_permission_line)
    end
  end

  describe "GET new" do
    it "assigns a new permission_line as @permission_line" do
      PermissionLine.stub(:new).and_return(mock_permission_line)
      get :new
      assigns[:permission_line].should equal(mock_permission_line)
    end
  end

  describe "GET edit" do
    it "assigns the requested permission_line as @permission_line" do
      PermissionLine.stub(:find).with("37").and_return(mock_permission_line)
      get :edit, :id => "37"
      assigns[:permission_line].should equal(mock_permission_line)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created permission_line as @permission_line" do
        PermissionLine.stub(:new).with({'these' => 'params'}).and_return(mock_permission_line(:save => true))
        post :create, :permission_line => {:these => 'params'}
        assigns[:permission_line].should equal(mock_permission_line)
      end

      it "redirects to the created permission_line" do
        PermissionLine.stub(:new).and_return(mock_permission_line(:save => true))
        post :create, :permission_line => {}
        response.should redirect_to(permission_line_url(mock_permission_line))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved permission_line as @permission_line" do
        PermissionLine.stub(:new).with({'these' => 'params'}).and_return(mock_permission_line(:save => false))
        post :create, :permission_line => {:these => 'params'}
        assigns[:permission_line].should equal(mock_permission_line)
      end

      it "re-renders the 'new' template" do
        PermissionLine.stub(:new).and_return(mock_permission_line(:save => false))
        post :create, :permission_line => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested permission_line" do
        PermissionLine.should_receive(:find).with("37").and_return(mock_permission_line)
        mock_permission_line.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :permission_line => {:these => 'params'}
      end

      it "assigns the requested permission_line as @permission_line" do
        PermissionLine.stub(:find).and_return(mock_permission_line(:update_attributes => true))
        put :update, :id => "1"
        assigns[:permission_line].should equal(mock_permission_line)
      end

      it "redirects to the permission_line" do
        PermissionLine.stub(:find).and_return(mock_permission_line(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(permission_line_url(mock_permission_line))
      end
    end

    describe "with invalid params" do
      it "updates the requested permission_line" do
        PermissionLine.should_receive(:find).with("37").and_return(mock_permission_line)
        mock_permission_line.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :permission_line => {:these => 'params'}
      end

      it "assigns the permission_line as @permission_line" do
        PermissionLine.stub(:find).and_return(mock_permission_line(:update_attributes => false))
        put :update, :id => "1"
        assigns[:permission_line].should equal(mock_permission_line)
      end

      it "re-renders the 'edit' template" do
        PermissionLine.stub(:find).and_return(mock_permission_line(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested permission_line" do
      PermissionLine.should_receive(:find).with("37").and_return(mock_permission_line)
      mock_permission_line.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the permission_lines list" do
      PermissionLine.stub(:find).and_return(mock_permission_line(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(permission_lines_url)
    end
  end

end
