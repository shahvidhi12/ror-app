Rails.application.routes.draw do
get 'countryserach', to: 'home#countrysearch'
  root "home#index"
  resources :categories do
    resources :authors do
      resources :books
    end
  end

end
