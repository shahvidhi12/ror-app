class BooksController < ApplicationController
    include ResourceLoad
    def new
        @book = @author.books.build
    end
    def create
        def create
            @book = @author.books.new(book_params)

            if @book.save
              redirect_to category_author_path(@category, @author)
            else
              render :new, status: :unprocessable_entity
            end
        end
    end
    def destroy
        @book = @author.books.find(params[:id])
        @book.destroy
        redirect_to category_author_path(@category, @author), status: :see_other
    end
    def show
        @book = @author.books.find(params[:id])
      end
    private 
    def book_params
        params.require(:book).permit(:title, :body, :references)
    end
end
