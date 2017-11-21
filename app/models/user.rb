class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true

  has_many :dependents
  accepts_nested_attributes_for :dependents, reject_if: proc { |attributes| attributes['name'].blank? }

  has_many :deduction_details
  has_many :deductions, through: :deduction_details
  accepts_nested_attributes_for :deduction_details

  after_initialize :default_values

  def dependents_attributes=(dependents_attributes)
    dependents_attributes.values.each do |dependent_attribute|
      if !dependent_attribute[:name] .empty?
        self.dependents.build(dependent_attribute)
      end
    end
  end

  def self.grand_total
    total = 0
    DeductionDetail.all.each do |dd|
      @deduction = Deduction.find(dd.deduction_id)
      if @deduction.is_flat?
        total += @deduction.amount
      else
        total += (User.find(dd.user_id).salary * dd.percentage * 0.01)
      end
    end
    total
  end

  private
    def default_values
      self.admin ||= false
      self.setup_complete ||= false
    end
end
