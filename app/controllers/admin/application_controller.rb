class Admin::Controller < ApplicationController
    before_action :authenticate_user!
    before_action :is_admin?
    layout "admin"
    
    private
  
    def is_admin?
      unless current_user.is_admin
      flash[:danger] = "Tu n'es pas un admin"
         redirect_to root_path
      end
    end
  end