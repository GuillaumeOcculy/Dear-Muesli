Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  get :my_account, to: 'pages#my_account', path: 'mon-compte'

  resources :users
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
end
