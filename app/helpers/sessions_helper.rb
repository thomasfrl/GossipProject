module SessionsHelper
  def current_user
   User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def valid_user?(user)
    User.find_by(id: session[:user_id]) == user
  end
end