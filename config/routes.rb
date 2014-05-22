Rails.application.routes.draw do
  root 'created_pictures#new'

  resources :created_pictures

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
end
