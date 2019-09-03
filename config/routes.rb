Rails.application.routes.draw do
  # Routes for signing up

  match("/sign_up", { :controller => "sessions", :action => "registration_form", :via => "get"})

  match("/insert_member", { :controller => "sessions", :action => "create", :via => "post" })
          
  # Routes for signing in
  match("/sign_in", { :controller => "sessions", :action => "session_form", :via => "get"})
  
  match("/verify_credentials", { :controller => "sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/sign_out", { :controller => "sessions", :action => "remove_cookies", :via => "get"})

  # Route for editing account
  
  match("/edit", { :controller => "sessions", :action => "edit_account", :via => "get"})
  
  match("/update_member", { :controller => "sessions", :action => "update_account", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_account", { :controller => "sessions", :action => "delete_account", :via => "get"})


  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
