class LeaderSessionsController < ApplicationController
  skip_before_action(:force_leader_sign_in, { :only => [:registration_form, :session_form, :add_cookie] })

  def session_form
    render({ :template => "leader_sessions/sign_in.html.erb" })
  end

  def registration_form
    render({ :template => "leader_sessions/sign_up.html.erb" })
  end

  def add_cookie
    leader = Leader.where({ :email => params.fetch(:email) }).at(0)

    if leader != nil && leader.authenticate(params.fetch(:password))
      session[:leader_id] = leader.id

      redirect_to("/", { :notice => "Signed in successfully." })
    else
      redirect_to("/leader_sign_in", { :alert => "Oh no! Something's gone horribly wrong 😨. Please try again." })
    end
  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
