class DeductionDetailsController < ApplicationController

  def index
    @deduction_details = User.find(params[:user_id]).deduction_details
    respond_to do |f|
      f.json {render json: @deduction_details}
      f.html {render :index}
    end
  end

  def update
    current_user.deduction_details.destroy_all
    params[:deduction_details].each do |dd|
      if params[:deduction_details][dd.to_s].include?("deduction_id")
        @deduction_detail = DeductionDetail.create(user_id: current_user.id, deduction_id: dd)
        if params[:deduction_details][dd.to_s].include?("percentage")
          @deduction_detail.update(percentage: params[:deduction_details][dd.to_s][:percentage])
        end
      end
    end
    if total_deductions > current_user.salary
      current_user.deduction_details.destroy_all
      redirect_to user_deduction_details_path(current_user.id), notice: "Deductions cannot be greater than salary." and return
    else
      redirect_to user_path(current_user)
    end
  end

  private
    def deduction_detail_params
      params.require(:deduction_detail).permit(:user_id, :id, :details => [:id, :percentage])
    end
end
