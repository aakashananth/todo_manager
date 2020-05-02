class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    if current_user
      redirect_to todos_path
    else
      render "new"
    end
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
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
