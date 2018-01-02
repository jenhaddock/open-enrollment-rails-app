class DeductionsController < ApplicationController

  def new
    if current_user.admin?
      @deduction = Deduction.new
    else
      redirect_to user_path(current_user)
    end
  end

  def index
    if current_user.admin?
      @deductions = Deduction.all
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @deduction = Deduction.find(params[:id])
    render :json => @deduction
  end

  def create
    if current_user.admin?
      @deduction = Deduction.new(deduction_params)
      if @deduction.save
        @deductions = Deduction.all
        render 'index'
      else
        render 'new'
      end
    else
      redirect_to user_path(current_user)
    end
  end

  def edit
    if current_user.admin?
      @deduction = Deduction.find(params[:id])
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @deduction = Deduction.find(params[:id])
    if @deduction.update(deduction_params)
      @deductions = Deduction.all
      render 'index'
    else
      render 'edit'
    end
  end

 private
   def deduction_params
     params.require(:deduction).permit(:name, :is_flat, :is_percentage, :amount)
   end
end
