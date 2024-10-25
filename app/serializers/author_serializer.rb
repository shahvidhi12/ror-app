class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :name, :last_name, :email, :age, :country, :date

  has_many :books
  belongs_to :category

  def category
    {
      id: object.category.id,
      status: object.category.status
    }
  end

  def books
    object.books.map do |book|

      {
        id: book.id,
        title: book.title.presence || 'Untitled'
      }
    end
  end
end
