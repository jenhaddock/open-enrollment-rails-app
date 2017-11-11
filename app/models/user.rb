class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true

  has_many :dependents
  accepts_nested_attributes_for :dependents, reject_if: proc { |attributes| attributes['name'].blank? }

  has_many :deduction_details
  has_many :deductions, through: :deduction_details
  accepts_nested_attributes_for :deduction_details

  after_initialize :default_values

  private
    def default_values
      self.admin ||= false
      self.setup_complete ||= false
    end
end
