class Author < ApplicationRecord
    belongs_to :category
    has_many :books, dependent: :destroy

    validates :name, presence: true
    validates :body, presence: true

end
