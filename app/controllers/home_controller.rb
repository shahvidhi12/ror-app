class HomeController < ApplicationController
  def index
    @countries = Author.pluck(:country).uniq

  
    @categories = Category.includes(authors: :books).page(params[:page]).per(2)

    if params[:query].present?
      @categories = @categories.where("status ILIKE ?", "%#{params[:query]}%")
    end

    if params[:country].present?
      @filtered_authors = Author.where(country: params[:country])
      @categories = @categories.joins(:authors).where(authors: { country: params[:country] }).distinct
    else
      @filtered_authors = [] 
    end
  end
end
