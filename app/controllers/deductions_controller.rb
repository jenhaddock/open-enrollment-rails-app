class DeductionsController < ApplicationController

  def new
    @deduction = Deduction.new
  end

  def index
    @deductions = Deduction.all
  end

  def create
    @deduction = Deduction.new(deduction_params)
    if @deduction.save
      @deductions = Deduction.all
      render 'index'
    else
      render 'new'
    end
  end

  def edit
    @deduction = Deduction.find(params[:id])
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
