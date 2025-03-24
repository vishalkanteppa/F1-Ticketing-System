class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      puts user.role
      if user.role == "customer"
        redirect_to home_index_path, notice: "Successfully logged in"
        session[:admin] = 0
      else
        session[:admin] = 1
        redirect_to admin_url
      end
    else
      redirect_to sessions_new_path, alert: "Invalid user/password combination"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logged out"
  end
end
