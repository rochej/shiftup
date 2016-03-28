class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params['email'])
    session[:user_id]=@user.id
    respond_to do |format|
      format.html{render root}
      format.json{render json: @user}
    end
  end
end