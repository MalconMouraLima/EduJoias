Rails.application.routes.draw do
  devise_for :users
    resources :jewels do
    	resources :reviews
    end
    root 'jewels#index'
end
