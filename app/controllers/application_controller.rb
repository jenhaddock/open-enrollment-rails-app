class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :total_deductions

  def current_user
    session[:user_id]
  end
end
