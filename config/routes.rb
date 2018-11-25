Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :news_feeds, only: [:index,:new,:create]
  resources :search_queries, only: [:index,:new,:create]

  get 'home_search_query/:query/:sources', to: 'pages#home_search_query'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
