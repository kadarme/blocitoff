Rails.application.routes.draw do
  devise_for :users
  get 'about' => 'welcome#about'

  resources :todos, only: [:new, :create, :show]
  
  root to: 'welcome#index'
end
