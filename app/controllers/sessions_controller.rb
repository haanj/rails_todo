class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to lists_url
    else
      flash[:danger] = "Incorrect email/password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
