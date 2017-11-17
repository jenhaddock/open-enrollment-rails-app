class UsersController < ApplicationController
  before_action :require_login, only: [:show, :index, :update]

  def homepage
    if current_user
      @user = User.find(current_user.id)
      if @user.setup_complete?
        render 'show'
      else
        init_new
        render 'new'
      end
    end
  end

  def new
    @user = User.find(current_user.id)
    if @user.setup_complete?
      render 'show'
    else
      init_new
    end
  end

  def init_new
    @user.dependents.build
    @user.dependents.build
    @user.dependents.build
    @user.dependents.build
    @user.deduction_details.build
  end

  def index
    @user = User.find(current_user.id)
    if @user.admin
      @users = User.all
    else
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    @user.deduction_details.destroy_all
    if @user.save
      params[:user][:deduction_details_attributes].each do |detail|
        if params[:user][:deduction_details_attributes][detail.to_s][:id] == "1"
          temp_percentage = 0
          if !params[:user][:deduction_details_attributes][detail.to_s][:percentage].nil?
            temp_percentage = params[:user][:deduction_details_attributes][detail.to_s][:percentage]
          end
          DeductionDetail.create(:user_id => @user.id,
                                  :deduction_id => params[:user][:deduction_details_attributes][detail.to_s][:deduction_id],
                                  :percentage => temp_percentage)
        end
      end
      if total_deductions > current_user.salary
        @user.deduction_details.destroy_all
        @user.update(setup_complete: false)
        redirect_to new_user_path, notice: "Deductions cannot be greater than salary." and return
      else
        redirect_to user_path(@user)
      end
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(current_user.id)
    if !@user.setup_complete?
      redirect_to new_user_path
    else
      if !params[:id].nil? and params[:id] != 'index' and @user.admin?
        if User.find(params[:id])
          @user = User.find(params[:id])
        end
      end
    end
  end

  def summary
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :salary, :admin, :setup_complete,
                                 :dependents_attributes => [:name, :relation],
                                 :deduction_detail_attributes => [:id, :details => [:id, :percentage]])
  end
end
