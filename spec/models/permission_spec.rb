require 'spec_helper'

describe Permission do
  before(:each) do
    @valid_attributes = {
      :sys_function_id => 1,
      :name => "value for name",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Permission.create!(@valid_attributes)
  end
end
