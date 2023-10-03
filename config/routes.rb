Rails.application.routes.draw do
  devise_for :users

  root to: "walks#home"

  resources :dogs, only: %i[new create] do
    resources :walks, only: %i[index show]
  end

  # Dog profile
  get '/mydog', to: 'dogs#mydog', as: "my_dog"

  resources :tindogs, only: %i[index create]

  resources :matches, only: %i[index show] do
    resources :messages, only: %i[create]
  end

end
