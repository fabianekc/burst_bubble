class StaticController < ApplicationController
  before_action :logged_in, only: [:overview]

  def overview
  end

  def test
    render layout: "nil"
  end
  
  def login
    render layout: "empty"
  end

  def configure
    if General.count > 0
      redirect_to root_path
    else
      render layout: "empty"
    end
  end

  def config1
    @user = General.new
    render layout: "empty"
  end

  def config_end
    render layout: "empty"
  end

  def password
    @user = General.new(user_params)
    if @user.save
      redirect_to config_end_path
    else
      flash.now[:danger] = @user.errors.full_messages.uniq.join(", ")
      render "config1", layout: "empty"
    end
  end

  private
    def user_params
      params.require(:general).permit(:password, :password_confirmation)
    end

end
