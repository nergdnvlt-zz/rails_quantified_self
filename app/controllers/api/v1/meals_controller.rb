class Api::V1::MealsController < ApplicationController
  before_action :set_meal, only: [:show]
  def index
    render json: Meal.all.as_json
  end

  def show
    render json: @meal.as_json
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
  end
end
