Rails.application.routes.draw do
  get 'words/update'

  resources :projects do
    post 'import', :action => 'import_yaml'
    get 'export/:language', :action => 'export_yaml', as: :export
    member do
      get 'translate/:target_language', :action => 'translate', as: :translate
      post 'translate/:target_language', :action => 'translate', as: :translate_second_ref
      get 'show_collaborators', :action => 'show_collaborators', as: :show_collaborators
      post 'add_collaborator', :action => 'add_collaborator', as: :add_collaborator
      delete 'remove_collaborator/:assignment', :action => 'remove_collaborator', as: :remove_collaborator
    end
  end

  devise_for :users
  root :to => 'pages#home'
  get 'pages/home'

  resources :words, only: [:update] do
    get 'translate', :action => 'translate'
  end

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
