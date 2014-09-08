class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments

  ## Roles
  PROJECTADMIN = 1
  TRANSLATOR = 2

  def self.get_roles
    {
        PROJECTADMIN: I18n.t('role.projectadmin'),
        TRANSLATOR: I18n.t('role.translator')
    }
  end
end
