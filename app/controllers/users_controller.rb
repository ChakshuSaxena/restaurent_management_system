class UsersController < ApplicationController
  before_action :find_user, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token
  $$variable = 10
  def index
    @users = User.all.limit(5)
    render json: {user: @users}
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(users_params)
    if @user.save!
      render json: {user: @user, message: "User created successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end
  def update
    if @user.update(users_params)
      render json: {user: @user, message: "User updated successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end
  def destroy
    if @user.destroy
      render json: {message: "User deleted successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end

  private
    def find_user
      @user = User.find(params[:id])
    end

    def users_params
      params.require(:users).permit(:name, :email, :phone_number)
    end
end
