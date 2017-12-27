class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name

  has_many :dependents
  has_many :deduction_details
  has_many :deductions, through: :deduction_details
end
