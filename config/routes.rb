Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  root 'posts#index'

  namespace :admin do
  # this is a shortcut to the code in lines 18-20
  # When we want to route with a module and use that module's name as the URL prefix, we can use the namespace method instead of scope, module.
  # The namespace method makes the assumption that the path prefix and module name match, saving us some typing.
  # Top-tip: There is one important difference between scope '/admin', module: 'admin' and namespace :admin, and it's in the URL helpers. Remember above that using scope gave us a stats_path helper. But now that we are using namespace, run rake routes again. You'll see that the helper is now prefixed with admin_, so stats_path becomes admin_stats_path. If you switch from scope to namespace, take care to update any URL helpers you have in use!
    resources :stats, only: [:index]
  end
  
  # scope '/admin', module: 'admin' do
  # # scope tells us to use the /admin route while module tells us to look in the controllers/admin folder
  #   resources :stats, only: [:index]
  # end
  
end
