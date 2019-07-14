Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

 
#Use /admin as a URL prefix, and let Rails know that all of the included routes will be handled by controllers in the admin module.

  namespace :admin do
    resources :stats, only: [:index]
  end
   
  root 'posts#index'
end
