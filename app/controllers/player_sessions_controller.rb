class PlayerSessionsController < ApplicationController
  skip_before_action(:force_player_sign_in, { :only => [:new_session_form, :add_cookie] })

  def new_session_form
    render({ :template => "player_sessions/sign_in.html.erb" })
  end

  def add_cookie
    player = Player.where({ :email => params.fetch(:email) }).at(0)
    
    the_supplied_password = params.fetch(:password)
    
    if player != nil
      they_are_real = player.authenticate(the_supplied_password)
    
      if they_are_real == false
        redirect_to("/sign_in", { :alert => "Password incorrect." })
      else
        session[:player_id] = player.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/player_sign_in", { :alert => "There's no player account with that email address." })
    end

  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
