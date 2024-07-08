class MenusController < ApplicationController
  before_action :find_menu, only: [:destroy]
  skip_before_action :verify_authenticity_token
  def index
    @menus = Menu.all.limit(5)
    render json: {menus: menus}
  end
  def new
    @menu = Menu.new
  end
  def create
    @menu = Menu.new(menu_params)
    if @menu.save!
      render json: {menu: @menu, message: "Menu created successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end
  def destroy
    if @menu.destroy
      render json: {message: "Menu deleted successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end

  private
    def find_restrau
      @menu = Menu.find(params[:id])
    end

    def menu_params
      debugger
      params.require(:menus).permit(:restrau_id)
    end
end
