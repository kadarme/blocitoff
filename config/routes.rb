Blocitoff::Application.routes.draw do
 
  resources :lists do
    resources :items, only: [:create, :destroy]
  end
  
  devise_for :users
  resources :users, only: [:update]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
