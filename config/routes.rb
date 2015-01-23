Rails.application.routes.draw do
  get 'welcome/index'

  get 'welcome/about'

  resources :todos, only: [:new, :create, :show]
  
  root to: 'welcome#index'
end
