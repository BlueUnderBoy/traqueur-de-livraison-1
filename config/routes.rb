Rails.application.routes.draw do
  # Routes for the User resource:
  root to: "users#loreg"

  get("/users/sign_up", {:controller => "users", :action => "sup"})

  get("/users/sign_in", {:controller => "users", :action => "validate"})

  get("/users/home", {:controller => "users", :action => "index"})

  # CREATE
  post("/insert_user", { :controller => "users", :action => "create" })
          
  # READ
  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:path_id", { :controller => "users", :action => "show" })
  
  # UPDATE
  
  post("/modify_user/:path_id", { :controller => "users", :action => "update" })
  
  # DELETE
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
