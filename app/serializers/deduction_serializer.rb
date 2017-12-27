class DeductionSerializer < ActiveModel::Serializer
  attributes :name, :is_percentage, :is_flat, :amount

  has_many :deduction_detail
  has_many :users, through: :deduction_details
end
