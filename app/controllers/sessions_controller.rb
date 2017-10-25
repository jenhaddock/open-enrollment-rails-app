class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if !@user.nil? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to 'signin'
    end
  end

  def destroy
    if !session[:user_id].nil?
      session.delete :user_id
    end
    redirect_to '/'
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
