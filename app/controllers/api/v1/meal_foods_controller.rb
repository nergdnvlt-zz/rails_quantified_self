class Api::V1::MealFoodsController < ApplicationController
  def create
    meal = Meal.find(params[:meal_id])
    food = Food.find(params[:id])
    render json: MealFood.create!(meal: meal, food: food).as_json
  end
end
