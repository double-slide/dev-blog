Rails.application.routes.draw do
  get 'home/welcome'
  root "articles#index"
 
  # below is only for GET, we can instead use the resources method to map the conventional routes (CRUD)
  # get "/articles", to: "articles#index"

  resources :articles do
    resources :comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
