class SystemModule < ActiveRecord::Base
  has_many :system_functions, :dependent => :destroy
  has_many :permissions, :through => :system_functions

  validates_presence_of :name
  validates_uniqueness_of :name

  def to_s
    name
  end
  
  def to_param
    "#{id}-#{name}"
  end
end
