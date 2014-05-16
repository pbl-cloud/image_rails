Rails.application.routes.draw do
  root 'created_pictures#new'

  resources :created_pictures
end
