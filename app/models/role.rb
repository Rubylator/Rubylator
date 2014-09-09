class Role < ActiveRecord::Base
  has_many :assignments
  has_many :users, :through => :assignments

  ## Roles
  PROJECTADMIN = 1
  TRANSLATOR = 2

  def self.get_roles
    [
        [get_role_name(PROJECTADMIN), PROJECTADMIN],
        [get_role_name(TRANSLATOR), TRANSLATOR]
    ]
  end

  def self.get_role_name role_id
    case role_id
      when PROJECTADMIN
        I18n.t('role.projectadmin')
      when TRANSLATOR
        I18n.t('role.translator')
    end
  end
end
