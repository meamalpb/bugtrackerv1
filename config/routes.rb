Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :issues
   end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  get "/projectusers", to: "projects#project_user"
  get "/projectusers/:id" , to: "projects#project_user_show", as: "project_user_show"
  get "admin/projectusers/:id/add/:user_id" , to: "admin#add_user" , as: "project_add_user"
  get "admin/projectusers/:id/delete/:user_id" , to: "admin#delete_user" , as: "project_delete_user"

end
