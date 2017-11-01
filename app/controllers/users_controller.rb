class UsersController < ApplicationController
  before_action :require_login, only: [:show, :index]

  def homepage
  end

  def new
    @user = User.new
  end

  def index
    @user = User.find(current_user)
    if @user.is_admin?
      @users = Users.all
    else
      redirect_to user_path(@user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(current_user)
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :salary, :admin, :setup_complete)
  end
end
