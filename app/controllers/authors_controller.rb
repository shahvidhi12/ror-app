class AuthorsController < ApplicationController
include ResourceLoad
  def index
    @authors = @category.authors.all 
  end
  
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author =  @category.authors.build
  end

  def create
    logger.debug "Params: #{params.inspect}"
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
  def set_category
    @category = Category.find(params[:category_id])
  end
  def set_author
    @author = @category.authors.find(params[:id])
  end
  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    redirect_tocategory_authors_path(@category)
  end
  private
  def author_params
   
    params.permit(:name, :body, :date, :last_name, :email, :age, :country)
  end
end
