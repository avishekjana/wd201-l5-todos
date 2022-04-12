class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
  
  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    new_user = User.create!(first_name: params[:first_name], last_name: params[:last_name], email: email, password: password)
    session[:current_user_id] = new_user.id
    redirect_to "/"
  end
end
