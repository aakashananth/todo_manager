class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |user| user.to_displayable_string }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    render plain: "A new user with id #{new_user.id} is created"
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by email: email
    if (user != nil && user.password.to_s == password)
      render plain: "true"
    else
      render plain: "false"
    end
  end
end
