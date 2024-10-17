Rails.application.routes.draw do
  root "categories#index"
  resources :categories do
    resources :authors do
      resources :books
    end
  end

end
