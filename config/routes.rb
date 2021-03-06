Rails.application.routes.draw do
  root 'products#index'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  resources :products do
    resources :product_reviews
  end

  resources :companies do
      resources :company_reviews
  end

  resources :reviews

end
