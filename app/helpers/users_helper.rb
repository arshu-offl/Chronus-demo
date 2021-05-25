module UsersHelper
  def gravatar_for(user)

    email = user.email
    email.downcase!
    gravatar_id = Digest::MD5::hexdigest(email)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}" 
    
    image_tag(gravatar_url, :alt => user.name, class: 'gravatar')
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
