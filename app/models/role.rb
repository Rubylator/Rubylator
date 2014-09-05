class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments

  ## Roles
  PROJECTADMIN = 1
  TRANSLATOR = 2
end
