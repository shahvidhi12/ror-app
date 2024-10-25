class BooksController < ApplicationController
    before_action :set_author, only: [:index, :show, :destroy, :edit, :update]
    def index
        @books = @author.books.all
    end
    def new
      @book = @author.books.build
    end
  
    def create
      @book = @author.books.new(book_params)
  
      if @book.save
        redirect_to category_author_path(@category, @author), notice: 'Book was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
        @book = @author.books.find(params[:id])
    end
    
    def update
        @book = @author.books.find(params[:id])
        
        if @book.update(book_params)
          redirect_to category_author_book_path(@category, @author, @book), notice: 'Book was successfully updated.'
        else
          render :edit, status: :unprocessable_entity
        end
    end
  
    def destroy
      @book = @author.books.find(params[:id])
      @book.destroy
      redirect_to category_author_path(@category, @author), notice: 'Book was successfully deleted.', status: :see_other
    end
  
    def show
      @book = @author.books.find(params[:id])
    end
  
    private 
    def set_author
        @category = Category.find(params[:category_id])
        @author = @category.authors.find(params[:author_id]) 
      end
  
    def book_params
      params.require(:book).permit(:title, :body, :references)
    end
  end
  