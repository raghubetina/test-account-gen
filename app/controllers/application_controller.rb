class ApplicationController < ActionController::Base
  before_action(:load_current_player)
  before_action(:force_player_sign_in)
  
  def load_current_player
    @current_player = Player.where({ :id => session[:player_id] }).at(0)
  end
  
  def force_player_sign_in
    if @current_player == nil
      redirect_to("/player_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
