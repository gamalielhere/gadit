Rails.application.routes.draw do
  root 'articles#index'


  #New accounts
  resources :accounts, only: [:new, :create, :index, :show, :destroy]
  resources :articles, only: [:new, :create, :index] do
    resources :comments, shallow: true
    patch '/comments/:id/comments_vote' => 'comments#vote', as: :comment_vote

  end
  get '/articles/:id' => 'articles#show', as: :article
  get '/articles/:id/edit' => 'articles#edit', as: :article_edit
  patch 'articles/:id' => 'articles#update'
  patch 'articles/:id/vote' => 'articles#vote', as: 'article_vote'
  delete 'articles/:id' => 'articles#destroy'
  #Sessions
  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
