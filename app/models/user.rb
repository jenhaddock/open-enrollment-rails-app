class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true

  has_many :dependents

  has_many :deduction_details
  has_many :deductions, through: :deduction_details

  after_initialize :default_values

  private
    def default_values
      self.admin ||= false
      self.setup_complete ||= false
    end

    def total_deductions(user)
      @user = User.find(user)
      total = 0
      @user.deduction_details.each.do |ded_det|
        @deduction = Deduction.find(ded_det.deduction_id)
        if @deduction.is_percentage?
          total = total + (@user.salary * ded_det.percentage * 0.01)
        else
          total = total + @deduction.amount
        end
      end
    end
end
