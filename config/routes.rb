Rails.application.routes.draw do
  devise_for :users

  # Dog with an action button
  root to: "walks#home"

  # Walks are nested in dogs
  resources :dogs, only: %i[new create] do
    resources :walks, only: %i[index show]
  end

  # The user's dog profile
  get '/mydog', to: 'dogs#mydog', as: "my_dog"

  # Tindogs are like friend requests: creating a tindog == swiping positively
  resources :tindogs, only: %i[index create]

  # Chatrooms are created if both users swiped positively and can now interact
  resources :chatrooms, only: %i[index show] do
    resources :messages, only: %i[create]
  end

end
