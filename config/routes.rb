Rails.application.routes.draw do
  get 'welcome/homepage'

  devise_for :users
  resources :jewels do
    resources :reviews
  end
  #root 'jewels#index'
  root 'welcome#homepage'
end
