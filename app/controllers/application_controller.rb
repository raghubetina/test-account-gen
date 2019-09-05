class ApplicationController < ActionController::Base

  before_action(:load_current_leader)
  before_action(:force_leader_sign_in)
  
  def load_current_leader
    @current_leader = Leader.where({ :id => session[:leader_id] }).at(0)
  end
  
  def force_leader_sign_in
    if @current_leader == nil
      redirect_to("/leader_sign_in", { :notice => "You have to sign in first." })
    end
  end
end
