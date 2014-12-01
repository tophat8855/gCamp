class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        flash[:success] = "User was successfully created"
        format.html { redirect_to users_path}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.erros, status: :unprocessable_entity }
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end
