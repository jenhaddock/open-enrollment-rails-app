class Deduction < ApplicationRecord
  validates :name, presence: true

  has_many :deduction_details
  has_many :users, through: :deduction_details
end
