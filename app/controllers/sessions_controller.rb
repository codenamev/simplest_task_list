class SessionsController < ApplicationController
  def new
    redirect_to root_url, notice: => "Already logged in!" if @current_user
  end

  def create
    user = User.find_by_email(params[:email])
    if user or cookies.permanent[:auth_token]
      # auto-login for next visit
      cookies.permanent[:auth_token] = user.auth_token
      @current_user = user
      redirect_to user_tasks_path(@current_user), notice: => "Logged in!"
    else
      flash.now.alert = "Invalid email"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, notice: => "Logged out!"
  end

end
