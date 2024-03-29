Rails.application.routes.draw do
  root 'home#home'
  resources :rooms, except: %i[ show ] do
    resources :messages
  end
  get '/rooms/:room', to: 'rooms#show', as: 'show_room'
  get '/sessions/authorize', to: 'sessions#authorize', as: 'auth'
end
