class SessionsController < ApplicationController
  def new
  end

  def create
    if auth['uid']
      @user = User.find_or_create_by(id: auth['uid']) do |u|
        u.email = auth['info']['email']
      end
      load_user_page
    else
      if !@user.nil? && @user.authenticate(params[:user][:password])
        load_user_page
      else
        redirect_to 'signin'
      end
    end
  end

  def load_user_page
    session[:user_id] = @user.id
    if @user.setup_complete?
      redirect_to user_path(@user)
    else
      redirect_to new_user_path(@user)
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
