Rails.application.routes.draw do
  resources :rooms, only: %i[show]
  root 'rooms#index'
end
