Rails.application.routes.draw do
  # Routes for signing up

  match("/coach_sign_up", { :controller => "coaches", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/coach_sign_in", { :controller => "coach_sessions", :action => "new_session_form", :via => "get"})
  
  match("/coach_verify_credentials", { :controller => "coach_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/coach_sign_out", { :controller => "coach_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_coach", { :controller => "coaches", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_coach", { :controller => "coaches", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_coach", { :controller => "coaches", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_coach_account", { :controller => "coaches", :action => "destroy", :via => "get"})


  #------------------------------

  root 'pages#home'
  # Routes for signing up

  match("/player_sign_up", { :controller => "players", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/player_sign_in", { :controller => "player_sessions", :action => "new_session_form", :via => "get"})
  
  match("/player_verify_credentials", { :controller => "player_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/player_sign_out", { :controller => "player_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_player", { :controller => "players", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_player", { :controller => "players", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_player", { :controller => "players", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_player_account", { :controller => "players", :action => "destroy", :via => "get"})


  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
