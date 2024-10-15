class Author < ApplicationRecord
    has_many :books, dependent: :destroy

    validates :name, presence: true
    validates :body, presence: true

end
