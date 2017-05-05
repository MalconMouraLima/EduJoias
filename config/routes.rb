Rails.application.routes.draw do
  resource :jewels

  root 'jewels#index'
end
