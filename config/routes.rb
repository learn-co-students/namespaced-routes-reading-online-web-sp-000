Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # get '/admin/stats', to: 'stats#index' #we can browse to /admin/stats for the stats page, and we can no longer go straight to /stats.
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/delete', to: 'authors#delete'
  # get '/admin/authors/create', to: 'authors#create'
  # get '/admin/comments/moderate', to: 'comments#moderate'

  #scope allows us to prefix a block of routes under one grouping.
  # Scoping works nicely to group our URLs together logically,
  # scope '/admin', module: 'admin' do# We're telling scope that we want to use /admin as a URL prefix, and we're also letting Rails know that all of the included routes will be handled by controllers in the admin module
  #   resources :stats, only: [:index]
  # end

  # When we want to route with a module and use that module's name as the URL prefix, we can use the namespace method instead of scope, module.
  # The namespace method makes the assumption that the path prefix and module name match
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
