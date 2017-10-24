class User < ApplicationRecord
  has_many :dependents

  has_many :deduction_details
  has_many :deductions, through: :deduction_details
end
