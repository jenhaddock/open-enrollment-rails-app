class DeductionDetailsController < ApplicationController

  def index
    @deduction_details = current_user.deduction_details
  end

  def update
    current_user.deduction_details.delete_all
    params[:deduction_details].each do |dd|
      if params[:deduction_details][dd.to_s].include?("deduction_id")
        @deduction_detail = DeductionDetail.create(user_id: current_user.id, deduction_id: dd)
        if params[:deduction_details][dd.to_s].include?("percentage")
          @deduction_detail.update(percentage: params[:deduction_details][dd.to_s][:percentage])
          @deduction_detail.save
        end
      end
    end
    redirect_to user_path(current_user)
  end

  private
    def deduction_detail_params
      params.require(:deduction_detail).permit(:id, :details => [:id, :percentage])
    end
end
