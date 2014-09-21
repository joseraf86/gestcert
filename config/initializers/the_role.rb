# TheRole.config.param_name => value

TheRole.configure do |config|
  config.layout                     = :application  # default Layout for TheRole UI
  config.default_user_role          = nil           # set default role (name)
  config.first_user_should_be_admin = false
  config.access_denied_method       = :access_denied
  config.login_required_method      = :authenticate_user!
  config.destroy_strategy           = :restrict_with_exception # can be nil
end
