Rails.application.routes.draw do
  resources :search_analyses
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "search_analyses#index"
end
