class AuthorsController < ApplicationController

  def index
    @category = Category.find(params[:category_id]) 
    @authors = @category.authors.all 
  end
  
  def show
    @category = Category.find(params[:category_id])
    @author = Author.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @author =  @category.authors.build
  end

  def create
    @category = Category.find(params[:category_id])
    @author = @category.authors.new(author_params)

    if @author.save
      redirect_to category_author_path(@category, @author)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @author = @category.authors.find(params[:id])
  end
  def update
    @category = Category.find(params[:category_id])
    @author = @category.authors.find(params[:id])

    if @author.update(author_params)
      redirect_to category_author_path(@category, @author) 
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to root_path, status: :see_other
  end
  private
  def author_params
    params.require(:author).permit(:name, :body, :date, :last_name, :email, :age, :country)
  end
end
