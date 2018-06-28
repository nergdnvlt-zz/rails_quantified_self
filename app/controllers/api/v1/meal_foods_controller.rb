class Api::V1::MealFoodsController < ApplicationController
  before_action :set_food, only: [:create, :destroy]
  before_action :set_meal, only: [:create, :destroy]
  before_action :set_mealfood, only: [:destroy]

  def create
    render json: MealFood.create!(meal: @meal, food: @food).as_json
  end

  def destroy
    @mealfood.delete
    render json: { "message": "Successfully removed #{@food.name} from #{@meal.name}" }
  end

  private

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end

  def set_food
    @food = Food.find(params[:id])
  end

  def set_mealfood
    @mealfood = @meal.meal_foods.find_by(food_id: @food.id)
  end
end
