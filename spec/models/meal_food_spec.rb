require 'rails_helper'

describe MealFood do
  describe 'validations' do
    it {should belong_to :meal }
    it {should belong_to :food }
  end

  describe 'instance methods' do
    it "returns a message for successful creation" do
      meal = Meal.create!(name: "snack")
      food = meal.foods.create!(name: "artichoke", calories: 67)
      mealfood = MealFood.create!(meal: meal, food: food)

      message = mealfood.as_json

      expect(message).to be_a Hash
      expect(message).to eq({ "message": "Successfully added artichoke to snack" })
    end
  end
end
