Rails.application.routes.draw do

  root "home#index"
  resources :categories do
    resources :authors do
      resources :books
    end
  end

end
