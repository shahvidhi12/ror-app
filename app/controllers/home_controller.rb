class HomeController < ApplicationController
  def index
   
    @countries = Author.pluck(:country).uniq

   
    @categories = Category.all.includes(authors: :books)
  
   
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
