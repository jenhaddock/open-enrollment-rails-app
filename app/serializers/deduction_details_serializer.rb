class DeductionDetailSerializer < ActiveModel::Serializer
  attributes :user_id, :deduction_id, :percentage

  belongs_to :user
  belongs_to :deduction
end
