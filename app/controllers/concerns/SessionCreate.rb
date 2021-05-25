module SessionCreate
  extend ActiveSupport::Concern

  def create_session(user)

    @session = Session.new(:user_id => @user.id, :session_hash => generateHash(@user.password_digest) )
    
    if @session.save
      cookies.signed[:login_token] = @session.session_hash
    else
      false
    end
  end

  def generateHash(password_hash)
    Digest::SHA2.hexdigest Time.now.to_s + password_hash
  end

  def logged_in?
    if(cookies.signed[:login_token]) 
      @session = Session.find_by(:session_hash => cookies.signed[:login_token])
      
      if !@session
        cookies.delete :login_token
        return false
      end
      
      @user = User.find(@session.user_id)
      return true
    else
      return false
    end
  end
end