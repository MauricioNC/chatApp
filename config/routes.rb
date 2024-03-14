Rails.application.routes.draw do
  root 'home#home'
  resources :rooms
end
