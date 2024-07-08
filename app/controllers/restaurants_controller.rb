class RestaurantsController < ApplicationController
  before_action :find_restrau, only: [:update, :destroy]
  skip_before_action :verify_authenticity_token
  def index
    @restaurents = Restrau.all.limit(5)

    render json: {restaurents: @restaurents}
  end
  def new
    @restrau = Restrau.new
  end
  def create
    @restrau = Restrau.new(restrau_params)
    if @restrau.save!
      render json: {restrau: @restrau, message: "Restaurent created successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end
  def update
    if @restrau.update(restrau_params)
      render json: {restrau: @restrau, message: "Restaurent updated successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end
  def destroy
    if @restrau.destroy
      render json: {message: "Restaurent deleted successfully!", status: 200}
    else
      render json: {message: "Something went wrong"}
    end
  end

  private
    def find_restrau
      @restrau = Restrau.find(params[:id])
    end

    def restrau_params
      params.require(:restaurents).permit(:name)
    end
end
