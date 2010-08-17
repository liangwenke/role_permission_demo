class Admin < ActiveRecord::Base
  has_many :admin_roles, :dependent => :destroy
  has_many :roles, :through => :admin_roles
  belongs_to :department

  validates_presence_of :name, :password
  validates_uniqueness_of :name
  
  AUTH_WHITE_LIST = ["home","accounts"]
  
  acts_as_audited

  def permissions
    Permission.all(:joins => { :roles => :admin_roles }, :conditions => { :admin_roles => { :admin_id => id } }).uniq
  end

  def permission_lines
    PermissionLine.all(
      :joins => { :permission => { :roles => :admin_roles } }, 
      :conditions => { :permission => { :roles => { :admin_roles => { :admin_id => id } } } }
    ).uniq
  end

  def to_s
    name
  end
  
  def to_param
    "#{id}-#{name}"
  end
  
  def allow_to?(controller, action, method)
    if AUTH_WHITE_LIST.include?(controller)
      true
    else
      permission_lines.map { |pl| [pl.controller.strip, pl.action.strip, pl.method.strip].join('-') }.include?([controller, action, method].join('-'))
    end
  end
  
  def allow_to_module?(module_id)
    (@allow_module_ids ||= permissions.map { |p| p.system_module_id }).include?(module_id)
  end
  
  def allow_to_function?(function_id)
    (@allow_function_ids ||= permissions.map(&:system_function_id)).include?(function_id)
  end
end
