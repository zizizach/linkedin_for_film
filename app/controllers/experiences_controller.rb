class ExperiencesController < ApplicationController
    before_action :set_experience, only: [:edit, :update]
    
    def new
        @experience = Experience.new
    end
    
    def create
        params[:experience][:user_id] = current_user.id
        @experience = Experience.new(experience_attributes)
        if @experience.save
            flash[:notice] = 'Successfully Created'
            redirect_to root_path
        else
            render :new
        end
    end
    
    def edit; end
    
    private 
    def experience_attributes
        params.require(:experience).permit(:start_date, :end_date, :title, :description, :user_id)
    end
    
    def set_experience
        @experience = Experience.find(params[:id])
    end
   
end