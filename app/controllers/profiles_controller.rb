class ProfilesController < ApplicationController
    before_action :set_profile, only: [:edit, :update]
    def new
        @profile = Profile.new
    end
    
    def create
        params[:profile][:user_id] = current_user.id
        @profile = Profile.new(profile_attributes)
        if @profile.save
            flash[:notice] = 'Successfully Created'
            redirect_to root_path
        else
            render :new
        end
    end
    
    def edit; end
    
    def update
        if @profile.update_attributes(profile_attributes)
            flash[:notice] = 'Successfully Updated'
            redirect_to root_path
        else
            render :edit
        end
    end
    
    def show
    end
    
    private 
    def profile_attributes
        params.require(:profile).permit(:first_name, :last_name, :location, :user_id)
    end
    
    def set_profile
        @profile = Profile.find(params[:id])
    end
end
