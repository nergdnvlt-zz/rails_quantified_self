class Api::V1::FoodsController < ApplicationController
  def index
    render json: Food.all.as_json
  end
end
