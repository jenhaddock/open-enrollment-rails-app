class UsersController < ApplicationController
  before_action :require_login, only: [:show, :index, :update]

  def homepage
    if current_user
      @user = User.find(current_user.id)
      if @user.setup_complete?
        render 'show'
      else
        @user.dependents.build
        @user.dependents.build
        @user.dependents.build
        @user.dependents.build
        render 'new'
      end
    end
  end

  def new
    @user = User.find(current_user.id)
    @user.dependents.build
    @user.dependents.build
    @user.dependents.build
    @user.dependents.build
  end

  def index
    @user = User.find(current_user.id)
    if @user.is_admin?
      @users = Users.all
    else
      redirect_to user_path(@user)
    end
  end

  def update
    binding.pry
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
    if !@user.setup_complete?
      redirect_to new_user_path
    end
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :salary, :admin, :setup_complete,
                                 :dependents_attributes => [:name, :relation],
                                 :deduction_ids => [])
  end
end
