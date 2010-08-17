class Role < ActiveRecord::Base
  has_many :admin_roles, :dependent => :destroy
  has_many :admins, :through => :admin_roles
  has_many :permission_roles, :dependent => :destroy
  has_many :permissions, :through => :permission_roles

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    name
  end
  
  def to_param
    "#{id}-#{name}"
  end
  
  def has_permissions_with?(module_or_function)
    !(permissions & module_or_function.permissions).blank?
  end
end
