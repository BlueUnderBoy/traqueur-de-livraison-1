Rails.application.routes.draw do
  # Routes for the Delivery resource:

  # CREATE
  post("/insert_delivery/:uid", { :controller => "deliveries", :action => "create" })
          
  # READ
  get("/deliveries", { :controller => "deliveries", :action => "index" })
  
  get("/deliveries/:path_id", { :controller => "deliveries", :action => "show" })
  
  # UPDATE
  
  post("/modify_delivery/:did", { :controller => "deliveries", :action => "update" })
  
  # DELETE
  get("/delete_delivery/:did", { :controller => "deliveries", :action => "destroy" })

  #------------------------------

  # Routes for the User resource:
  root to: "users#loreg"

  get("/users/sign_up", {:controller => "users", :action => "sup"})

  get("/users/sign_in", {:controller => "users", :action => "validate"})

  get("/users/home/:uid", {:controller => "users", :action => "index"})

  get("/users/edit/:uid", {:controller => "users", :action => "edit"})

  get("/users/sign_out", {:controller => "users", :action => "exit" })

  # CREATE
  post("/users/sign_up", { :controller => "users", :action => "create" })
          
  # READ
  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:path_id", { :controller => "users", :action => "show" })
  
  # UPDATE
  
  post("/modify_user/:uid", { :controller => "users", :action => "update" })
  
  # DELETE
  get("/delete_user/:uid", { :controller => "users", :action => "destroy" })

  #------------------------------

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
