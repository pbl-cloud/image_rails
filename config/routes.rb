Rails.application.routes.draw do
  root 'comic_images#index'

  resources :process_image_tasks, only: [:new, :create]

  resources :comic_images, only: [:index] do
    get 'my', on: :collection
  end

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  devise_scope :user do
    delete 'logout', to: 'devise/sessions#destroy', as: :logout
  end
end
