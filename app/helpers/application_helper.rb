module ApplicationHelper
  def user_signed_in?
    session[:user]
  end
end
