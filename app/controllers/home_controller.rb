class HomeController < ApplicationController
  def index
    @countries = Author.all.pluck(:country).uniq
    @authors = Author.includes(:category, :books)

    if params[:query].present?
      @authors = @authors.joins(:category).where('categories.status LIKE ?', "%#{params[:query]}%")
    end

    if params[:country].present?
      @authors = @authors.where(country: params[:country])
    end

    @authors = @authors.page(params[:page]).per(5) 

    @serialized_authors = @authors.map { |author| AuthorSerializer.new(author).as_json }
  end
end
