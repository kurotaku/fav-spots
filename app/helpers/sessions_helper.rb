module SessionsHelper
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
  
  def admin_logged_in?
    if current_user && current_user.admin || current_user && current_user.root
      return true
    else
      return false
    end
  end
  
  def root_logged_in?
    if current_user && current_user.root
      return true
    else
      return false
    end
  end
  
  def store_location
    session[:forwarding_url] = request.url if request.get?
  end
  
end
