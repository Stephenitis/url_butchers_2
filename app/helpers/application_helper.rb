module ApplicationHelper

  def user_signed_in?
    session[:token]
  end

  def current_user
    User.find_by_token(session[:token])
  end

  def give_token(user)
    session[:token] = user.token
  end

end
