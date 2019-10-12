Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # telling scope that we want to use '/admin' as a URL prefix
  # & letting Rails know of included routes that will be handled by controlelrs in admin module
  # scope '/admin', module: 'admin' do
  #   resources :stats, only: [:index]
  # end

  #shortcut to version above:
  namespace :admin do
    resources :stats, only: [:index]
  end

  root 'posts#index'
end

# BEFORE ADDING MODULE TO SCOPE
# Prefix Verb  URI Pattern                                  Controller#Action
#     author_posts GET   /authors/:author_id/posts(.:format)          posts#index
#  new_author_post GET   /authors/:author_id/posts/new(.:format)      posts#new
# edit_author_post GET   /authors/:author_id/posts/:id/edit(.:format) posts#edit
#      author_post GET   /authors/:author_id/posts/:id(.:format)      posts#show
#          authors GET   /authors(.:format)                           authors#index
#           author GET   /authors/:id(.:format)                       authors#show
#            posts GET   /posts(.:format)                             posts#index
#                  POST  /posts(.:format)                             posts#create
#         new_post GET   /posts/new(.:format)                         posts#new
#        edit_post GET   /posts/:id/edit(.:format)                    posts#edit
#             post GET   /posts/:id(.:format)                         posts#show
#                  PATCH /posts/:id(.:format)                         posts#update
#                  PUT   /posts/:id(.:format)                         posts#update
#            stats GET   /admin/stats(.:format)                       stats#index
#             root GET   /                                            posts#index

# AFTER ADDING MODULE TO SCOPE
# Prefix Verb  URI Pattern                                  Controller#Action
#     author_posts GET   /authors/:author_id/posts(.:format)          posts#index
#  new_author_post GET   /authors/:author_id/posts/new(.:format)      posts#new
# edit_author_post GET   /authors/:author_id/posts/:id/edit(.:format) posts#edit
#      author_post GET   /authors/:author_id/posts/:id(.:format)      posts#show
#          authors GET   /authors(.:format)                           authors#index
#           author GET   /authors/:id(.:format)                       authors#show
#            posts GET   /posts(.:format)                             posts#index
#                  POST  /posts(.:format)                             posts#create
#         new_post GET   /posts/new(.:format)                         posts#new
#        edit_post GET   /posts/:id/edit(.:format)                    posts#edit
#             post GET   /posts/:id(.:format)                         posts#show
#                  PATCH /posts/:id(.:format)                         posts#update
#                  PUT   /posts/:id(.:format)                         posts#update
#            stats GET   /admin/stats(.:format)                       admin/stats#index *ADDED admin/*
#             root GET   /                                            posts#index
