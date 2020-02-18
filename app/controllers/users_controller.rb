class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_adequate_user?, only: [:show]

  def show
    @user = User.find(params['id'])
    @user_events = Event.where(manager: @user.id)
  end

  private

  def is_adequate_user?
  	unless current_user == User.find(params['id'])
  		flash[:danger] = "Tssss, tu peux pas accéder à la page d'un autre utilisateur"
  		redirect_to user_path(current_user.id)
  	end
  end
end
