class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :edit]

  def show
    current_user_must_own_profile
  end

  def edit
    current_user_must_own_profile
  end

  def update
  end
  
  private

  def current_user_must_own_profile
  	@user = User.find(params[:id])
  	if current_user.id == @user.id
  	else
  	  flash[:danger] = "Vous n'avez pas accès à ce compte"
  	  redirect_to events_path
  	end
  end
end
