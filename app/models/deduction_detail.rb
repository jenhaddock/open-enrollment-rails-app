class DeductionDetail < ApplicationRecord
  belongs_to :user
  belongs_to :deduction

  validates :percentage, numericality: {less_than: 101}, allow_nil: true
end
