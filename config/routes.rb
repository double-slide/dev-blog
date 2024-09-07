Rails.application.routes.draw do
  root 'home#welcome'

  # get '/', to: 'home#welcome'

  get 'sign_up', to: 'users#new', as: :sign_up
  post 'sign_up', to: 'users#create'

  # get "articles#index"
 


  # below is only for GET, we can instead use the resources method to map the conventional routes (CRUD)
  # get "/articles", to: "articles#index"

  resources :articles do
    resources :comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
