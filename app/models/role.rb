class Role < ActiveRecord::Base
  # include RoleModel
  include TheRole::Role
  # or following alias for AR:
  # acts_as_role
end
