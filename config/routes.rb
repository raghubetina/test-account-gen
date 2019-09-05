Rails.application.routes.draw do
  # Routes for signing up

  match("/leader_sign_up", { :controller => "leader_sessions", :action => "registration_form", :via => "get"})
  
  # Routes for signing in
  match("/leader_sign_in", { :controller => "leader_sessions", :action => "session_form", :via => "get"})
  
  match("/leader_verify_credentials", { :controller => "leader_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/leader_sign_out", { :controller => "leader_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/insert_leader", { :controller => "leaders", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_leader", { :controller => "leaders", :action => "edit_account", :via => "get"})
  
  match("/update_leader", { :controller => "leaders", :action => "update_account", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_leader_account", { :controller => "leaders", :action => "delete_account", :via => "get"})


  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
