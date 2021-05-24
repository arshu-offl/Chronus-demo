class SessionsController < ApplicationController

  include SessionCreate

  def login
    if logged_in?
      redirect_to root_path
    end
    @user = User.new
  end

  def new
    email = params[:session][:email]
    email.downcase!
    password = params[:session][:password]

    @user = User.find_by(:email => email)

    if @user && @user.authenticate(password)
      
      # Login and create cookies
      if(create_session(@user))
        redirect_to root_path
      end

    else
      render 'login'
    end
  end

  def destroy

    if cookies.signed[:login_token] 
      cookies.delete :login_token
    end

    redirect_to root_path
  end
end
