Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  get :my_account, to: 'pages#my_account', path: 'mon-compte'

  resources :users
  resources :password_resets, only: [:new, :create, :edit, :update] do
  	collection do
  		get :success
  	end
  end

  namespace :admin do
    get :dashboard, to: 'admin#dashboard'
    resources :users
  end
end
