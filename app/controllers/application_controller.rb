class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :total_deductions

    def current_user
      User.find_by(id: session[:user_id])
    end

    def total_deductions
      @user = current_user
      total = 0
      @user.deduction_details.each do |ded_det|
        @deduction = Deduction.find(ded_det.deduction_id)
        if @deduction.is_percentage?
          total = total + (@user.salary * ded_det.percentage * 0.01)
        else
          total = total + @deduction.amount
        end
      end
      total
    end
end
