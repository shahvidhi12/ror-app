module ResourceLoad
    extend ActiveSupport:: Concern

    included do
        before_action :set_category
        before_action :set_author, only: [:edit, :update, :show]
    end
    private
    def set_category
        @category = Category.find(params[:category_id])
      end
      def set_author
        @author = @category.authors.find(params[:id])
      end
end