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
    end

end
