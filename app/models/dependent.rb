class Dependent < ApplicationRecord
  validates :name, presence: true
  validates :relation, presence: true

  belongs_to :user
end
