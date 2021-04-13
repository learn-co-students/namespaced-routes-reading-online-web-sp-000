Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # get '/admin/stats', to: 'stats#index'
    # change above to below

  # scope '/admin' module: 'admin' do
  #   resources :stats, only: [:index]
  # end
    # now change above to below

  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
