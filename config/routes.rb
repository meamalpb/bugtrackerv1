Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :issues
   end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "/projectusers", to: "projects#project_user"
  get "/projectusers/:id" , to: "projects#project_user_show"

end
