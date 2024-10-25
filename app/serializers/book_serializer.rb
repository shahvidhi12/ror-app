class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :body

  belongs_to :author
end
