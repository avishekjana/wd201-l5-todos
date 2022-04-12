class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render plain: "You have entered correct password"
    else
      render plain: "Incorrect email or password"
    end
  end
end