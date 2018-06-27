require 'rails_helper'

describe 'a get request to meals#index' do
  describe 'when processed correctly' do
    it 'gives a listing of all meals as JSON' do
      breakfast = Meal.create(name: 'breakfast')
      lunch = Meal.create(name: 'lunch')

      pear = breakfast.foods.create(name: 'pear', calories: 33)
      peach = breakfast.foods.create(name: 'peach', calories: 88)
      apricot = lunch.foods.create(name: 'apricot', calories: 108)
      goat = lunch.foods.create(name: 'goat', calories: 38)

      get '/api/v1/meals'

      expect(response).to be_successful

      meals = JSON.parse(response.body)

      expect(meals).to be_a Array
      expect(meals[0]["name"]).to eq("breakfast")
      expect(meals[1]["name"]).to eq("lunch")
      # expect(foods[0]).to eq({"id"=>1, "name"=>"pear", "calories"=>33})
      # expect(foods[1]).to eq({"id"=>2, "name"=>"peach", "calories"=>88})
      # expect(foods[2]).to eq({"id"=>3, "name"=>"apricot", "calories"=>108})
      # expect(foods[3]).to eq({"id"=>4, "name"=>"goat", "calories"=>38})
    end
  end
end
