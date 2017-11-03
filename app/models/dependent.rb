class Dependent < ApplicationRecord
  validates :name, presence: true
  validates :realtion, presence: true

  belongs_to :user
end
