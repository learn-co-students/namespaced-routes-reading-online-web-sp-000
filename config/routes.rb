Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  # scope '/admin', module: 'admin' do
  # same as below code, namespace assumes that the path prefix and module name match. Like above.
  # main difference now is that rake routes is no longer just stat_path/url, but rather admin_stat_path/url => namespace adds the "admin_"
  namespace :admin do
    #module: 'admin' => was added because we moved views, controllers into their own separate admin folders.
    resources :stats, only: [:index]
  end

  root 'posts#index'
end
