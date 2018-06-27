require 'rails_helper'

describe 'a post request to meals/meal_id/foods/food_id' do
  describe 'when processed correctly' do
    it 'gives response message in JSON for successful addition' do
      breakfast = Meal.create!(name: 'Breakfast')
      pear = breakfast.foods.create!(name: 'pear', calories: 33)

      peach = Food.create!(name: 'peach', calories: 88)

      post "/api/v1/meals/#{breakfast.id}/foods/#{peach.id}"

      expect(response).to be_successful

      message = JSON.parse(response.body)

      expect(message).to be_a Hash
      expect(message["message"]).to eq("Successfully added FOODNAME to MEALNAME")
    end
  end

  describe 'returns a 404 when' do
    it 'the meal is not found' do
      breakfast = Meal.create!(name: 'Breakfast')
      pear = breakfast.foods.create!(name: 'pear', calories: 33)

      apple = Food.create!(name: 'apple', calories: 88)

      post "/api/v1/meals/88/foods/#{apple.id}"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end

    it 'the food is not found' do
      breakfast = Meal.create!(name: 'Breakfast')

      post "/api/v1/meals/#{breakfast.id}/foods/88"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
