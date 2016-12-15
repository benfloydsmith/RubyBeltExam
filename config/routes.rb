Rails.application.routes.draw do
  #SESSIONS
  root 'sessions#index'
  post 'sessions/create' => 'sessions#create'
  delete 'sessions' => 'sessions#logout'
  #USERS
  post 'users/create' => 'users#create'
  get 'users/:id' => 'users#show'
  #SHOES
  get 'shoes' => 'shoes#index'
  post 'shoes/create' => 'shoes#create'
  patch 'shoes/:id' => 'shoes#update'
  delete 'shoes/:id' => 'shoes#destroy'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

 
end
