require 'spec_helper'

describe Admin do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :password => "value for password",
      :department_id => 1,
      :description => "value for description",
      :last_login => Time.now,
      :login_times => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Admin.create!(@valid_attributes)
  end
end
