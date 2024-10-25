module ResourceLoad
    extend ActiveSupport::Concern
  
    included do
      before_action :set_category, only: [:show, :edit, :update, :destroy, :new, :index]
    end
  
    private
    def set_category
      @category = Category.find(params[:category_id])
    end

  
  end
  