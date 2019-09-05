class LeadersController < ApplicationController
  skip_before_action(:force_leader_sign_in, { :only => [:create] })
  
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
    
  def edit_account
    render({ :template => "leaders/edit_account.html.erb" })
  end

  def update_account
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

  def delete_account
    @current_leader.destroy
    reset_session
    
    redirect_to("/", { :notice => "Leader account cancelled" })
  end
  
end
