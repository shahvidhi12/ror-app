class HomeController < ApplicationController
  def index
    @categories = Category.includes(authors: :books)

    @countries = Author.distinct.pluck(:country)

 
    if params[:query].present?
      @categories = @categories.where("status ILIKE ?", "%#{params[:query]}%")
    end

   
    if params[:country].present?
      @authors = Author.includes(:books, :category).where(country: params[:country]).page(params[:page]).per(5)
    else
      @authors = Author.includes(:books, :category).page(params[:page]).per(5) 
    end
  end
end
