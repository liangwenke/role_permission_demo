class Permission < ActiveRecord::Base
  has_many :permission_lines, :dependent => :destroy
  has_many :permission_roles, :dependent => :destroy
  has_many :roles, :through => :permission_roles
  belongs_to :system_function

  validates_presence_of :name, :system_function
  validates_uniqueness_of :name

  def system_module
    system_function.system_module
  end

  def to_s
    name
  end
  
  def to_param
    "#{id}-#{name}"
  end

end
