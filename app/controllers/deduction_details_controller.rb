class DeductionDetailsController < ApplicationController

  def index
    @deduction_details = current_user.deduction_details
  end

  def update
    binding.pry
    current_user.deduction_details.delete_all
  end

  private
    def deduction_detail_params
      params.require(:deduction_detail).permit(:id, :details => [:id, :percentage])
    end
end
