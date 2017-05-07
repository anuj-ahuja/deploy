class UsersController < ApplicationController
 before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
 
  def new
  	@user=User.new
  end
  def show
  	@user=User.find(params[:id])
  end
  def create
  	@user=User.new(user_params)
  	if @user.save
      log_in @user
      redirect_to @user
      flash[:success] = "Welcome to the Sample App!"
  	else
  	   render 'new'	
  	 end  
  end
  private
  def user_params
      params.require(:user).permit(:name, :email,:phone, :password,
                                   :password_confirmation)
   end
   def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
   

end