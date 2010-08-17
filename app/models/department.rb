class Department < ActiveRecord::Base
  has_many :admins, :dependent => :destroy

  validates_presence_of :name
  validates_uniqueness_of :name

  def roles
    
  end

  def to_s
    name
  end
  
  def to_param
    "#{id}-#{name}"
  end
end
