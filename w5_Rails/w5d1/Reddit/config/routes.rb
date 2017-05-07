Rails.application.routes.draw do
  resources :users
  resource :sessions
  resources :subs
  resources :posts do
    resources :comments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
