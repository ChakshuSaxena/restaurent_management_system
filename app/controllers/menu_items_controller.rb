class MenuItemsController < ApplicationController
  before_action :find_menu_item, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token
  def index
    @menu_items = MenuItem.all.limit(5)
    render json: {menu_items: @menu_items}
  end
  def new
    @menu_item = MenuItem.new
  end
  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save!
      render json: {menu_item: @menu_item, message: "Menu item created successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end
  def update
    if @menu_item.update(menu_item_params)
      render json: {menu_item: @menu_item, message: "Menu item updated successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end
  def destroy
    if @menu_item.destroy
      render json: {message: "Menu item deleted successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end

  private
    def find_user
      @user = MenuItem.find(params[:id])
    end

    def menu_item_params
      params.require(:menu_items).permit(:name, :description, :price, :menu_id)
    end
end
