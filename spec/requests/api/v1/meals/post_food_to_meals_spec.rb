require 'rails_helper'

describe 'a get request to meals#index' do
  describe 'when processed correctly' do
    it 'gives a listing of all meals as JSON' do
      breakfast = Meal.create!(name: 'Breakfast')

      pear = breakfast.foods.create!(name: 'pear', calories: 33)
      peach = Food.create!(name: 'peach', calories: 88)

      post "/api/v1/meals/#{breakfast.id}/foods/#{peach.id}"

      expect(response).to be_successful

      message = JSON.parse(response.body)

      expect(message).to be_a Hash
      expect(message).to eq({ "message": "Successfully added FOODNAME to MEALNAME" })
    end
  end
end
