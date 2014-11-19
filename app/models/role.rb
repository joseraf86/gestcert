class Role < ActiveRecord::Base
  has_paper_trail

  # include RoleModel
  include TheRole::Role
  # or following alias for AR:
  # acts_as_role
end
