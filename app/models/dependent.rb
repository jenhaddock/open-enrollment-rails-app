class Dependent < ApplicationRecord
  validates :name, presence: true
  validates :realtion, presence: true

  belongs_to :user

  has_many :dependent_deduction_details
  has_many :deductions, through: :depedent_deduction_details
end
