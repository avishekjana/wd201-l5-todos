class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:created_at).map {|user| "#{user.name} (ID: #{user.id})"}
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: "#{user.name} (email: #{user.email})"
  end

  def new
  end

  def create
    email = params[:email]
    password = params[:password]
    new_user = User.create!(first_name: params[:first_name], last_name: params[:last_name], email: email, password: password)
    response_text = "Hey, your account has been created with the id #{new_user.id}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.where(["email =? and password =?", email, password]).first
    render plain: user.present?
  end
end
