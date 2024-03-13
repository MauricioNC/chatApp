Rails.application.routes.draw do
  get 'rooms/index'
  root 'home#home'
end
