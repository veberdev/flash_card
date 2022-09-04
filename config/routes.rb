Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :dashboard, only: :index

  resources :decks
end
