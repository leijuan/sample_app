class SessionsController < ApplicationController
  def new
    p "*****************8SessionsController.new"
  end

  def create
    p "*****************8SessionsController.create"
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end


  def destroy
    p "*****************SessionsController.destroy"
    log_out if logged_in?
    redirect_to root_url
  end

end
