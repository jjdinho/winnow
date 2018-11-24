Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :news_feeds, only: [:index,:new,:create]
  resources :search_queries, only: [:index,:new,:create]
end
