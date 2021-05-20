Rails.application.routes.draw do
  root "users#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    post '/users', to: 'users#index'
  end

  resources :sessions do
    get 'login' => 'sessions#new'
    post 'login' => 'sessions#create'
    delete 'logout' => 'sessions#destroy'
  end

  resources :posts do
    get '/like', to: 'posts#like'
  end

end
