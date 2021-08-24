Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :messages, only:[:index, :show, :destroy]

  resources :messages, only: [] do
    resources :labels, only: [:create]
  end

  resources :labels, only: :destroy

  get 'auth/google_oauth2/callback', to: 'sessions#GoogleAuth'
  get 'auth/failure', to: redirect('/')

end
