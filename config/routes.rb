Rails.application.routes.draw do

  root :to => 'home#index'

  devise_for :admins

  match('pets/all', {:via => :get, :to => "pets#all"})
  match('pets/new/add_breed', {:via => :get, :to => "pets#new"})
  match('pets/new/add_breed', {:via => [:post, :patch], :to => "pets#create"})
  match('pets/new/add_breed', {:via => [:post, :patch], :to => "pets#update"})
  match('pets/search_pets', {:via => :get, :to => "pets#search_pets"})

  match('pets', {:via => :patch, :to => "pets#create"})

  match('pets/:pet_id/remove_breed/:breed_id', {:via => :get, :to => 'pets#remove_breed'})

  resources :application_forms
  resources :pet_images
  resources :breeds
  resources :pets

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
