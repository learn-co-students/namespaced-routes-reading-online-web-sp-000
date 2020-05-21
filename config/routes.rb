Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  namespace :admin do
    resources :stats, only: [:index]
  end

  # scope '/admin', module: 'admin' do               'Namespace' assumes that path prefix and module name match
  #   resources :stats, only: [:index]                Changes name of URL helpers
  # end

  # get '/admin/stats', to: 'stats#index'             Replaced by 'scope' block above
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

  root 'posts#index'
end
