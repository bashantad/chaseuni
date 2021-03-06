Chaseuni::Application.routes.draw do
  
  resources :questions

  get 'enrollments', to: 'courses#enrollments'
  
  resources :courses do
    member do
      post 'enroll'

    end
    resources :exams

  end

  resources :faculties

  resources :pages
   
  root :to => 'courses#index'
  
  devise_for :users, :controllers => {
    :registrations => 'registrations',
    :passwords     => 'passwords',
    :sessions      => 'sessions',
    :confirmations => 'confirmations'
  }
  devise_scope :user do
    get '/login'  => 'sessions#new'
    get '/logout' => 'sessions#destroy'
  end

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
