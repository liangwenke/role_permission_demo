class PermissionLine < ActiveRecord::Base
  belongs_to :permission

  validates_presence_of :permission, :controller, :action, :method
  
  def to_param
    "#{id}-#{controller}-#{action}-#{method}"
  end
end
