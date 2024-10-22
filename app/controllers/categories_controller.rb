class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end
    def show
        @category = Category.find(params[:id])
      end
    
      def new
        @category = Category.new
      end
    
      def create
        @category = Category.new(cat_params)
    
        if @category.save
          redirect_to @category
        else
          render :new, status: :unprocessable_entity
        end
      end
    
      def edit
        @category = Category.find(params[:id])
      end
      def update
        @category = Category.find(params[:id])
    
        if @category.update(cat_params)
          redirect_to @category
        else
          render :edit, status: :unprocessable_entity
        end
      end
    
      def destroy
        @category = Category.find(params[:id])
        if @category.destroy
        redirect_to categories_path, notice: 'Category was successfully deleted.'
        else
        redirect_to categories_path, alert: 'Failed to delete category.'
        end
      end
    private 
    def cat_params
        params.require(:category).permit(:status, :grade)
    end
end
