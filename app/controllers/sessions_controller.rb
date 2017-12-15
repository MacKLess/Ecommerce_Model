class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    if current_user && user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = "There was a problem signing in, please try again."
      redirect_to '/sign_in'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have left Oddbits. Please come back soon!"
    redirect_to '/'
  end

end
