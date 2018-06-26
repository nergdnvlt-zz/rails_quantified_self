class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all.as_json
  end

  def show
    render json: Food.find(params[:id]).as_json
  end
end
