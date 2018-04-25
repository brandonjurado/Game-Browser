Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

  resources :games do
  end

  resources :likes do
    post :add_like, on: :collection
  end

end
