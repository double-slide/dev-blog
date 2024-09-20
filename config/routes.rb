Rails.application.routes.draw do
  get 'dashboard/index'
  # root 'home#welcome'
  root "articles#index"

  # get '/', to: 'home#welcome'

  get 'sign_up', to: 'users#new', as: :sign_up
  post 'sign_up', to: 'users#create'

  # get 'articles' to: 'articles#index', as: :articles

  get 'confirmations/confirm_email/:confirmation_token', to: 'confirmations#confirm_email', as: :confirm_email

  get '404', :to => 'application#page_not_found'

  get 'login', to: 'sessions#new', as: :login
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: :logout

  # below is only for GET, we can instead use the resources method to map the conventional routes (CRUD)
  # get "/articles", to: "articles#index"

  resources :articles do
    resources :comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
