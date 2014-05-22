Rails.application.routes.draw do
  root 'process_image_tasks#new'

  resources :process_image_tasks

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy', as: :logout
  end
end
