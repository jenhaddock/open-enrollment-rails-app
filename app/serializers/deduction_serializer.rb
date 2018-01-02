class DeductionSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_percentage, :is_flat, :amount

  has_many :deduction_details
  has_many :users, through: :deduction_details
end
