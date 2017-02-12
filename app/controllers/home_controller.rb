class HomeController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @email = current_user.email
        @first_name = current_user.profile.first_name
    end
end