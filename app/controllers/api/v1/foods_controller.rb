class Api::V1::FoodsController < ApplicationController
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
    food = Food.find(params[:id])
    food.update(food_params)
    food.save!
    render json: food.as_json
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories)
  end
end
