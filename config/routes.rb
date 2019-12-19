Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"

  resources :events do
    member do
      get :generate_groups
    end
  end
end
