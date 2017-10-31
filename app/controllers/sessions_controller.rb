class SessionsController < ApplicationController
  def new
  end

  def create
    if auth['uid']
      @user = User.find_or_create_by(id: auth['uid']) do |u|
        u.email = auth['info']['email']
      end
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      if !@user.nil? && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to 'signin'
      end
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
