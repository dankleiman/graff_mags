class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin!
    unless current_user.role == 'admin'
      flash[:alert] = 'You are not authorized to view this page.'
      redirect_to root_url
    end
  end
end
