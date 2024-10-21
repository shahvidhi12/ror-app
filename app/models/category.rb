class Category < ApplicationRecord
    has_many :authors, dependent: :destroy
    
end
