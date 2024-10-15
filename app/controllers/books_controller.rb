class BooksController < ApplicationController
    def create
        @author = Author.find(params[:author_id])
        @book = @author.books.create(book_params)
        redirect_to author_path(@author)
        @book = Book.new(book_params)
    end
    def destroy
        @author = Author.find(params[:author_id])
        @book = @author.books.find(params[:id])
        @book.destroy
        redirect_to author_path(@author), status: :see_other
      end
    private 
    def book_params
        params.require(:book).permit(:title, :body, :references)
    end
end
