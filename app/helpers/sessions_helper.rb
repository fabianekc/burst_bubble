module SessionsHelper
  def logged_in
    unless session[:logged_in]
      redirect_to root_path, notice: "Unauthorized access" unless logged_in?
    end
  end

  def logged_in?
    session[:logged_in] == true
  end

end
