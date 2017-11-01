class SessionsController < ApplicationController
  def new
  end

  def create
    #DRY it up
    if auth['uid']
      @user = User.find_or_create_by(id: auth['uid']) do |u|
        u.email = auth['info']['email']
      end
      session[:user_id] = @user.id
      if @user.setup_complete?
        redirect_to user_path(@user)
      else
        redirect_to user_new(@user)
      end
    else
      if !@user.nil? && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        if @user.setup_complete?
          redirect_to user_path(@user)
        else
          redirect_to user_new(@user)
        end
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
