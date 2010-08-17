class AdminRole < ActiveRecord::Base
  belongs_to :admin
  belongs_to :role
end