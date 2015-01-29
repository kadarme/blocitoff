Blocitoff::Application.routes.draw do
  resources :lists, except: [:index]
  resources :todos, only: [:new, :create, :show]
  
  devise_for :users
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end
