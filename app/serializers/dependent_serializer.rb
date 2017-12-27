class DependentSerializer < ActiveModel::Serializer
  attributes :name, :relation, :user_id

  belongs_to :user
end
