Rails.application.routes.draw do
  resources :rooms, only: %i[show] do
    resources :posts, only: %i[create]
  end
  root 'rooms#index'

  mount ActionCable.server => './cable'
end
