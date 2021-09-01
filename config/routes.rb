Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :messages, only:[:index, :show]

  resources :messages, only: [] do
    delete :batch_action, on: :collection
    resources :labels, only: [:create, :edit, :update]
    post :sync, on: :collection
    post :delete, on: :collection
    post :mark, on: :collection
  end
  resources :labels, only: [:destroy]

  get 'auth/google_oauth2/callback', to: 'sessions#GoogleAuth'
  get 'auth/failure', to: redirect('/')
end
