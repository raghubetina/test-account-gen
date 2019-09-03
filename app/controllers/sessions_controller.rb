class SessionsController < ApplicationController
  skip_before_action :authenticate_member!, :only => [:session_form, :add_cookie, :registration_form, :create, :delete]

  def session_form
    render({ :template => "sessions/sign_in.html.erb" })
  end

  def registration_form
    render({ :template => "sessions/sign_up.html.erb" })
  end

  def add_cookie
    member = Member.where({ :email => params.fetch(:email) }).at(0)

    if member != nil && member.authenticate(params.fetch(:password))
      session[:member_id] = member.id

      redirect_to("/", { :notice => "Signed in successfully." })
    else
      redirect_to("/sign_in", { :alert => "Oh no! Something's gone horribly wrong 😨. Please try again." })
    end
  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
  
  def create
    @member = Member.new

          
    @member.email = params.fetch(:email, nil)
                      
    @member.password = params.fetch(:password, nil)
    @member.password_confirmation = params.fetch(:password_confirmation, nil)
                
    @member.private = params.fetch(:private, nil)
                
    @member.bio = params.fetch(:bio, nil)
          
    save_status = @member.save

    if save_status == true
      session[:member_id] = @member.id
   
      redirect_to("/", { :notice => "Member account created successfully."})
    else
      redirect_to("/sign_up", { :alert => "Member account failed to create successfully."})
    end
  end
    
  def edit_account
    render({ :template => "sessions/edit_account.html.erb" })
  end

  def update_account
    @member = current_member

    
      
    @member.email = params.fetch(:email, @member.email)
          
          @member.password = params.fetch(:password, nil)
    @member.password_confirmation = params.fetch(:password_confirmation, nil)
          
      
    @member.private = params.fetch(:private, @member.private)
          
      
    @member.bio = params.fetch(:bio, @member.bio)
              
    if @member.valid?
      @member.save

      redirect_to("/", { :notice => "Member account created successfully."})
    else
      redirect_to("/sign_up", { :alert => "Member account failed to create successfully."})
    end
  end

  def delete_account
    current_member.destroy
    reset_session
    
    redirect_to("/", { :notice => "Member account cancelled" })
  end
  
end
