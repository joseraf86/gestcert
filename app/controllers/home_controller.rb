class HomeController < ApplicationController
  before_action :authenticate_user!#, except: [:index, :show]
  before_action :role_required#,  except: [:index, :show]
  def index; end
end
