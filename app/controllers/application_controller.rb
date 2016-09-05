class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
    private

  def current_user
    return unless session[:id]
    @current_user ||= User.find_by(id: session[:id])
  end
  helper_method :current_user
  
end

