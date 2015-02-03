Blocitoff::Application.routes.draw do
 
  resources :lists, except: [:index] do
    resources :items, only: [:create]
  end
  
  resources :todos, only: [:new, :create, :show]
  
  devise_for :users
  resources :users, only: [:update]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
