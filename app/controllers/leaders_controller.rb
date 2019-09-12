class LeadersController < ApplicationController
  skip_before_action(:force_leader_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "leader_sessions/sign_up.html.erb" })
  end

  def create
    @leader = Leader.new
          
    @leader.email = params.fetch(:email, nil)
                      
    @leader.password = params.fetch(:password, nil)
    @leader.password_confirmation = params.fetch(:password_confirmation, nil)
                
    @leader.bio = params.fetch(:bio, nil)
                
    @leader.admin = params.fetch(:admin, nil)
                
    @leader.username = params.fetch(:username, nil)
          
    save_status = @leader.save

    if save_status == true
      session[:leader_id] = @leader.id
   
      redirect_to("/", { :notice => "Leader account created successfully."})
    else
      redirect_to("/leader_sign_up", { :alert => "Leader account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "leaders/edit_registration_form.html.erb" })
  end

  def update
    @leader = @current_leader
          
    @leader.email = params.fetch(:email, @leader.email)
                
    @leader.password = params.fetch(:password, nil)
    @leader.password_confirmation = params.fetch(:password_confirmation, nil)
                
    @leader.bio = params.fetch(:bio, @leader.bio)
                
    @leader.admin = params.fetch(:admin, @leader.admin)
                
    @leader.username = params.fetch(:username, @leader.username)
              
    if @leader.valid?
      @leader.save

      redirect_to("/", { :notice => "Leader account created successfully."})
    else
      redirect_to("/leader_sign_up", { :alert => "Leader account failed to create successfully."})
    end
  end

  def destroy
    @current_leader.destroy
    reset_session
    
    redirect_to("/", { :notice => "Leader account cancelled" })
  end
  
end
