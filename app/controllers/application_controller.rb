class ApplicationController < ActionController::Base
  include TheRole::Controller

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def access_denied
    #flash.alert = t('the_role.access_denied')
    flash.alert = 'No posee permisos para realizar esta operación'
    redirect_to home_index_url
=begin
    if request.env['HTTP_REFERER'].nil?
      redirect_to home_index_url
    else
      flash.alert = 'No posee permisos para realizar esta operación'
      #redirect_to :back
      redirect_to home_index_url
    end
=end
  end
end
