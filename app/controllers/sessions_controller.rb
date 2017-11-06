class SessionsController < ApplicationController
  def new
  end

  def create
    if !auth.nil?
      @user = User.find_or_create_by(email: auth['info']['email']) do |u|
        u.password = SecureRandom.random_bytes(4)
        u.first_name = auth['info']['name'].split(' ')[0]
        u.last_name = auth['info']['name'].split(' ')[1]
      end
      @user.save
      load_user_page
    else
      @user = User.find_by(email: params[:user][:email])
      if !@user.nil?
        if @user.authenticate(params[:user][:password])
          load_user_page
        else
          redirect_to '/signin', notice: "Invalid Password"
        end
      else
        redirect_to '/signin', notice: "Must enter email address"
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

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
