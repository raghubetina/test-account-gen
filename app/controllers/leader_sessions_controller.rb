class LeaderSessionsController < ApplicationController
  skip_before_action(:force_leader_sign_in, { :only => [:new_session_form, :add_cookie] })

  def new_session_form
    render({ :template => "leader_sessions/sign_in.html.erb" })
  end

  def add_cookie
    leader = Leader.where({ :email => params.fetch(:email) }).at(0)
    
    the_supplied_password = params.fetch(:password)
    
    if leader != nil
      they_are_real = leader.authenticate(the_supplied_password)
    
      if they_are_real == false
        redirect_to("/sign_in", { :alert => "Password incorrect." })
      else
        session[:leader_id] = leader.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/leader_sign_in", { :alert => "Oh no! Something's gone horribly wrong 😨. Please try again." })
    end

  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
