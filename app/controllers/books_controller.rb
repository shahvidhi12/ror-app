class BooksController < ApplicationController
    def create
        def create
            @category = Category.find(params[:category_id])
            @author = Author.find(params[:author_id])
            @book = @author.books.new(book_params)
          
            if @book.save
              redirect_to category_author_path(@category, @author) 
            else
              render :new, status: :unprocessable_entity
            end
          end
          
    end
    def destroy
        @category = Category.find(params[:category_id])
        @author = Author.find(params[:author_id])
        @book = @author.books.find(params[:id])
        @book.destroy
        redirect_to category_author_book_path(@category,@author,@book), status: :see_other
    end
    def show
        @category = Category.find(params[:category_id])
        @author = Author.find(params[:author_id])
        @book = @author.books.find(params[:id])
      end
    private 
    def book_params
        params.require(:book).permit(:title, :body, :references)
    end
end
