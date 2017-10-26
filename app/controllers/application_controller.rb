class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :total_deductions

  def current_user
    session[:user_id]
  end

  def total_deductions(user)
    @user = User.find(user)
    total = 0
    @user.deduction_details.each.do |ded_det|
      @deduction = Deduction.find(ded_det.deduction_id)
      if @deduction.is_percentage?
        total = total + (@user.salary * @deduction.amount * 0.01)
      else
        total = total + @deduction.amount
      end
    end
    @user.dependents.each do |dependent|
      dependent.dependent_deduction_details.each do |dep_ded_det|
        @deduction = Deduction.find(dep_ded_det.deduction_id)
        total = total + @deduction.amount
      end
    end
  end
end
