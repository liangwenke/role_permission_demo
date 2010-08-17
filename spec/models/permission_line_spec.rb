require 'spec_helper'

describe PermissionLine do
  before(:each) do
    @valid_attributes = {
      :permission_id => 1,
      :controller => "value for controller",
      :action => "value for action",
      :method => "value for method",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    PermissionLine.create!(@valid_attributes)
  end
end
