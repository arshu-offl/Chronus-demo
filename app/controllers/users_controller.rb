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

  def show
    
    if !logged_in?
      redirect_to login_path
    end

    if params[:delete]
      ForumPost.where("User_id == #{@user.id} and id == #{params[:post_id]}").destroy_all
      Upvote.where("post_id == #{params[:post_id]}").destroy_all
    end

    @posts = ForumPost.order("forum_posts.created_at desc").limit(3).offset(params[:offset].to_i).where("forum_posts.User_id == '#{params[:id]}'")
  end

  def index

    if !logged_in?
      redirect_to login_path
    end

    offset = 0
    name = ''
    if params[:offset]
      offset = params[:offset].to_i
    end
    
    if params[:name]
      name = params[:name]
    end

    clause = "users.name LIKE ?"

    @fetched_users = getUsers(offset, clause, name)
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, 
        :password_confirmation)
    end

    def getUsers(offset = 0, clause = '', name = '')

      if name.length > 0
        name += '%'
      end

      User.order("users.name desc").limit(3).offset(offset * 3).where(clause, "#{name}")
    end
end
