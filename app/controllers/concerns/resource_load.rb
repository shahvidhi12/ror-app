module ResourceLoad
    extend ActiveSupport::Concern
  
    included do
      before_action :set_category
    end
  
    private
    def set_category
      @category = Category.find(params[:category_id])
    
    end

  
  end
  