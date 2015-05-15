class SessionsController < ApplicationController
  def new
  end

  def create
    user = General.first
    if user && user.authenticate(params[:session][:password])
      user.last_login = Time.now
      user.save!(:validate => false)
      session[:logged_in] = true
      Log.create(description:"log in", log_class:1,
                 log_objects:"[event: 'log in']")
      redirect_to overview_path
    else
      flash[:danger] = 'Invalid password'
      Log.create(description:"failed log in", log_class:1,
                 log_objects:"[event: 'failed log in']")
      redirect_to root_url
    end
  end

  def destroy
    session[:logged_in] = false
    Log.create(description:"log out", log_class:1,
               log_objects:"[event: 'log out']")
    redirect_to root_url
  end
end
