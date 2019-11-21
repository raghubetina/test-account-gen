class PlayersController < ApplicationController
  skip_before_action(:force_player_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "player_sessions/sign_up.html.erb" })
  end

  def create
    @player = Player.new
          
    @player.email = params.fetch(:email, @player.email)
                      
    @player.password = params.fetch(:password, nil)
    @player.password_confirmation = params.fetch(:password_confirmation, nil)
                
    @player.first_name = params.fetch(:first_name, @player.first_name)
                
    @player.middle_name = params.fetch(:middle_name, @player.middle_name)
                
    @player.bio = params.fetch(:bio, @player.bio)
                
    @player.a_bool = params.fetch(:a_bool, @player.a_bool)
                
    @player.a_text = params.fetch(:a_text, @player.a_text)
                
    @player.a_date = params.fetch(:a_date, @player.a_date)
                
    @player.a_time = params.fetch(:a_time, @player.a_time)
                
    @player.a_datetime = params.fetch(:a_datetime, @player.a_datetime)
          
    save_status = @player.save

    if save_status == true
      session[:player_id] = @player.id
   
      redirect_to("/", { :notice => "Player account created successfully."})
    else
      redirect_to("/player_sign_up", { :alert => "Player account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "players/edit_profile.html.erb" })
  end

  def update
    @player = @current_player
          
    @player.email = params.fetch(:email, @player.email)
                
    @player.password = params.fetch(:password, nil)
    @player.password_confirmation = params.fetch(:password_confirmation, nil)
                
    @player.first_name = params.fetch(:first_name, @player.first_name)
                
    @player.middle_name = params.fetch(:middle_name, @player.middle_name)
                
    @player.bio = params.fetch(:bio, @player.bio)
                
    @player.a_bool = params.fetch(:a_bool, @player.a_bool)
                
    @player.a_text = params.fetch(:a_text, @player.a_text)
                
    @player.a_date = params.fetch(:a_date, @player.a_date)
                
    @player.a_time = params.fetch(:a_time, @player.a_time)
                
    @player.a_datetime = params.fetch(:a_datetime, @player.a_datetime)
              
    if @player.valid?
      @player.save

      redirect_to("/", { :notice => "Player account updated successfully."})
    else
      render({ :template => "players/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_player.destroy
    reset_session
    
    redirect_to("/", { :notice => "Player account cancelled" })
  end
  
end
