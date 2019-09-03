class ApplicationController < ActionController::Base

  before_action :authenticate_member!

  def authenticate_member!
    if current_member == nil
      redirect_to("/sign_in", { :alert => "You must be signed in." })
    end
  end

  helper_method :current_member

  def current_member
    if @current_member == nil
      @current_member = Member.where({ :id => session[:member_id] }).at(0)
    end

    return @current_member
  end
end
