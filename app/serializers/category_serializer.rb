class CategorySerializer < ActiveModel::Serializer
  attributes :id, :status, :grade

  has_many :authors
end
