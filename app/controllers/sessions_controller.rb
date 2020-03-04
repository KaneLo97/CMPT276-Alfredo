class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      #takes user to their page
      log_in user
      redirect_to user
    else
      #error message for incorrect login info
      flash.now[:danger] = 'Invalid username/password. Please try again.'
      render 'new'
    end
  end
  def destroy
    log_out
    redirect_to root_url
  end
end
