Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root to: 'pages#home'
  get 'home_2', to: 'pages#home_2', as: 'home_2'
  get 'home_3', to: 'pages#home_3', as: 'home_3'
  get 'home_4', to: 'pages#home_4', as: 'home_4'
  get 'home_5', to: 'pages#home_5', as: 'home_5'
  post 'awesome_llama', to: 'pages#awesome_llama', as: 'awesome_llama'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :news_feeds do
    resources :search_queries, only: [:index,:new,:create]
  end

  get 'home_search_query/:query/:sources', to: 'pages#home_search_query'

  Rails.application.routes.draw do
    # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    authenticate :user, lambda { |u| u.admin } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
