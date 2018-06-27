require 'rails_helper'

describe 'a get request to meals#index' do
  describe 'when processed correctly' do
    it 'gives a listing of all meals as JSON' do
      breakfast = Meal.create!(name: 'Breakfast')
      lunch = Meal.create!(name: 'Lunch')

      pear = breakfast.foods.create!(name: 'pear', calories: 33)
      peach = breakfast.foods.create!(name: 'peach', calories: 88)
      apricot = lunch.foods.create!(name: 'apricot', calories: 108)
      goat = lunch.foods.create!(name: 'goat', calories: 38)

      get '/api/v1/meals'

      expect(response).to be_successful

      meals = JSON.parse(response.body)

      expect(meals).to be_a Array

      expect(meals[0]["name"]).to eq("Breakfast")
      expect(meals[0]["foods"]).to be_a Array
      expect(meals[0]["foods"][0]["name"]).to eq("pear")
      expect(meals[0]["foods"][0]["calories"]).to eq(33)
      expect(meals[0]["foods"][1]["name"]).to eq("peach")
      expect(meals[0]["foods"][1]["calories"]).to eq(88)

      expect(meals[1]["name"]).to eq("Lunch")
      expect(meals[1]["foods"][0]["name"]).to eq("apricot")
      expect(meals[1]["foods"][0]["calories"]).to eq(108)
      expect(meals[1]["foods"][1]["name"]).to eq("goat")
      expect(meals[1]["foods"][1]["calories"]).to eq(38)
    end
  end
end
