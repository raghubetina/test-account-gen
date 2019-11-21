class CoachesController < ApplicationController
  skip_before_action(:force_coach_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "coach_sessions/sign_up.html.erb" })
  end

  def create
    @coach = Coach.new
                
    @coach.password = params.fetch(:password, nil)
    @coach.password_confirmation = params.fetch(:password_confirmation, nil)
                
    @coach.email = params.fetch(:email, @coach.email)
                
    @coach.first_name = params.fetch(:first_name, @coach.first_name)
                
    @coach.middle_name = params.fetch(:middle_name, @coach.middle_name)
                
    @coach.bio = params.fetch(:bio, @coach.bio)
                
    @coach.a_bool = params.fetch(:a_bool, @coach.a_bool)
                
    @coach.a_text = params.fetch(:a_text, @coach.a_text)
                
    @coach.a_date = params.fetch(:a_date, @coach.a_date)
                
    @coach.a_time = params.fetch(:a_time, @coach.a_time)
                
    @coach.a_datetime = params.fetch(:a_datetime, @coach.a_datetime)
          
    save_status = @coach.save

    if save_status == true
      session[:coach_id] = @coach.id
   
      redirect_to("/", { :notice => "Coach account created successfully."})
    else
      redirect_to("/coach_sign_up", { :alert => "Coach account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "coaches/edit_profile.html.erb" })
  end

  def update
    @coach = @current_coach
          
    @coach.password = params.fetch(:password, nil)
    @coach.password_confirmation = params.fetch(:password_confirmation, nil)
                
    @coach.email = params.fetch(:email, @coach.email)
                
    @coach.first_name = params.fetch(:first_name, @coach.first_name)
                
    @coach.middle_name = params.fetch(:middle_name, @coach.middle_name)
                
    @coach.bio = params.fetch(:bio, @coach.bio)
                
    @coach.a_bool = params.fetch(:a_bool, @coach.a_bool)
                
    @coach.a_text = params.fetch(:a_text, @coach.a_text)
                
    @coach.a_date = params.fetch(:a_date, @coach.a_date)
                
    @coach.a_time = params.fetch(:a_time, @coach.a_time)
                
    @coach.a_datetime = params.fetch(:a_datetime, @coach.a_datetime)
              
    if @coach.valid?
      @coach.save

      redirect_to("/", { :notice => "Coach account updated successfully."})
    else
      render({ :template => "coaches/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_coach.destroy
    reset_session
    
    redirect_to("/", { :notice => "Coach account cancelled" })
  end
  
end
