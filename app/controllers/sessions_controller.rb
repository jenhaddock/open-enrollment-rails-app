class SessionsController < ApplicationController
  def new
  end

  def create
    if auth['uid']
      @user = User.find_or_create_by(email: auth['info']['email']) do |u|
      #  u.email = auth['info']['email']
        u.password = SecureRandom.random_bytes(4)
        u.first_name = auth['info']['name'].split(' ')[0]
        u.last_name = auth['info']['name'].split(' ')[1]
      end
      @user.save
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
