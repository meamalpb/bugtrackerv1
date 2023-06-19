Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :issues
   end


  root "home#index"
  get "/projectusers", to: "projects#project_user"
  get "/projectusers/:id" , to: "projects#project_user_show", as: "project_user_show"
  get "/myissues", to: "issues#myissues",  as: "my_issues"
  get "admin/projectusers/:id/add/:user_id" , to: "admin#add_user" , as: "project_add_user"
  get "admin/projectusers/:id/delete/:user_id" , to: "admin#delete_user" , as: "project_delete_user"


end
