class Api::V1::FoodsController < ApplicationController
  before_action :set_food, only: [:update]
  def index
    render json: Food.all.as_json
  end

  def show
    render json: Food.find(params[:id]).as_json
  end

  def create
    render json: Food.create!(food_params).as_json
  end

  def update
    @food.name = food_params[:name]
    @food.calories = food_params[:calories]
    @food.save!
    render json: @food.as_json
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
