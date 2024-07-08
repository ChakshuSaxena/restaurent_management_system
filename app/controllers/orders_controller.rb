class OrdersController < ApplicationController
  before_action :find_order, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @orders = Order.all.limit(5)
    render json: {orders: @orders}
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: { order: @order, message: "Order created successfully!", status: 200 }
    else
      render json: { message: "Something went wrong" }, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: { order: @order, message: "Order updated successfully!", status: 200 }
    else
      render json: { message: "Something went wrong" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @order.destroy
      render json: { order: @order, message: "Order deleted successfully!", status: 200 }
    else
      render json: { message: "Something went wrong" }, status: :unprocessable_entity
    end
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:orders).permit(:restrau_id, :user_id, order_items_attributes: [:menu_item_id, :quantity])
  end
end
