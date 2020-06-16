Rails.application.routes.draw do
  resources :stats, only: [:index]
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  get '/stats', to: 'stats#index'

  root 'posts#index'
end
