class DeductionsController < ApplicationController

  def new
    @deduction = Deduction.new
  end

  def index
    binding.pry
    @deductions = Deduction.all
  end

  def create
    @deduction = Deduction.new(deduction_params)
    if @deduction.save
      redirect_to 'index'
    else
      render 'new'
    end
  end

  def edit
  end

 private
   def deduction_params
     params.require(:deduction).permit(:name, :is_flat, :is_percentage, :amount)
   end
end
