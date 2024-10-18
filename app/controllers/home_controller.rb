class HomeController < ApplicationController
  def index
    @categories = Category.all.includes(authors: :books)
  end
end
