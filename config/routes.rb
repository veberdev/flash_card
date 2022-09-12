Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :dashboard, only: :index

  resources :decks, only: [:show, :new, :create, :update] do
    resources :questions, only: [:index, :new, :create, :show, :update, :destroy], controller: 'decks/questions'
    resources :study, only: [:index, :update], controller: 'decks/study'
  end

end
