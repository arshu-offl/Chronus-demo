class UsersController < ApplicationController
  include SessionCreate

  def signup

    if logged_in?
      redirect_to root_path
    end

    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      # Handle success
      @user.save
      params[:session] = {}
      params[:session][:email] = @user.email
      params[:session][:password] = @user.password

      # Login and create cookies
      if(create_session(@user))
        redirect_to root_path
      end
    else
      render 'signup'
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, 
        :password_confirmation)
    end
end
