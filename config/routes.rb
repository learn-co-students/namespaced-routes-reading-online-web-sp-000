Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  ####### standard routing ########################
  # get '/admin/stats', to: 'stats#index'
  # get '/admin/stats/whatever', to: 'stats#whatever'
  # get '/admin/authors/new', to: 'authors#new'
  # get '/admin/authors/create', to: 'authors#edit'
  # get '/admin/authors/delete', to: 'authors#delete'  
  
  ####### same routes with basic scoping ########################
  # scope '/admin' do
  #   resources :stats, only: [:index]
  #   get 'stats/whatever', to: 'stats#whatever'
  #   resources :authors, only: [:new, :edit, :delete]
  # end

  ####### same routes with module scoping ########################
  # scope '/admin', module: "admin" do
  #   resources :stats, only: [:index]
  #   get 'stats/whatever', to: 'stats#whatever'
  #   resources :authors, only: [:new, :edit, :delete]
  # end

  ####### same routes with namespacing ########################
  namespace :admin do
    resources :stats, only: [:index]
    get 'stats/whatever', to: 'stats#whatever'
    resources :authors, only: [:new, :edit, :delete]
  end  

  root 'posts#index'
end
