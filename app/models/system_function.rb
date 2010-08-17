class SystemFunction < ActiveRecord::Base
  has_many :permissions, :dependent => :destroy
  has_many :permission_lines, :through => :permissions
  belongs_to :system_module

  validates_presence_of :name, :system_module
  validates_uniqueness_of :name

  def to_s
    name
  end
  
  def to_param
    "#{id}-#{name}"
  end
end
