class CoachSessionsController < ApplicationController
  skip_before_action(:force_coach_sign_in, { :only => [:new_session_form, :add_cookie] })

  def new_session_form
    render({ :template => "coach_sessions/sign_in.html.erb" })
  end

  def add_cookie
    coach = Coach.where({ :email => params.fetch(:email) }).at(0)
    
    the_supplied_password = params.fetch(:password)
    
    if coach != nil
      are_they_legit = coach.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/sign_in", { :alert => "Password incorrect." })
      else
        session.store(:coach_id, coach.id)
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/coach_sign_in", { :alert => "There's no coach account with that email address." })
    end
  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
