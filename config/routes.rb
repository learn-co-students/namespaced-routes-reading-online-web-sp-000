Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  namespace :admin do
    resources :stats, only: [:index]
  end
# Rails gives us a namespace method as a shortcut. So, that we don't have to type out our scope explicitly as well as our module.
# If you switch from scope to namespace the URL helpers will change. Run rails routes with one active and then run one with the other active and see how the routes change.
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  # get '/admin/stats', to: 'stats#index'
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

  root 'posts#index'


end
