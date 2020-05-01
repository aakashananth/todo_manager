class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "Login Succesful"
    else
      render plain: "Invalid Credentials"
    end
  end
end
