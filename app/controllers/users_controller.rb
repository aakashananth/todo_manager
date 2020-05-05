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
    new_user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to "/"
    else
      redirect_to new_user_path, alert: new_user.errors.full_messages.join(", ")
    end
  end
end
