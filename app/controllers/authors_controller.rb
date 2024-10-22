class AuthorsController < ApplicationController
include ResourceLoad

  def index
    @authors = @category.authors.all 
  end
  
  def show
    @category = Category.find(params[:category_id])  # Find the category first
    @author = @category.authors.find(params[:id]) 
  end

  def new
    @author =  @category.authors.build
  end

  def create
    @author = @category.authors.new(author_params)

    if @author.save
      redirect_to category_author_path(@category, @author)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @author = @category.authors.find(params[:id])
  end

  def update
    @author = @category.authors.find(params[:id])

    if @author.update(author_params)
      redirect_to category_author_path(@category, @author) 
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @author = @category.authors.find(params[:id])
    @author.destroy
    redirect_to category_authors_path(@category)
  end
  private
  def author_params
    params.permit(:name, :body, :date, :last_name, :email, :age, :country)
  end
end
