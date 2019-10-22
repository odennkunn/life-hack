Rails.application.routes.draw do
  root to: 'titles#index'
  resources :articles
end

