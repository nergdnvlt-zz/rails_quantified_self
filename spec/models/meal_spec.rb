require 'rails_helper'

describe Meal do
  describe 'validations' do
    it { should validate_presence_of :name }
    it {should have_many :meal_foods}
    it {should have_many :foods}
  end

  describe 'instance methods' do
    it 'returns formatted JSON' do
      breakfast = Meal.create(name: 'Breakfast')

      pear = breakfast.foods.create(name: 'pear', calories: 33)
      peach = breakfast.foods.create(name: 'peach', calories: 88)

      response = breakfast.as_json
      expect(response).to eq({
          "id": 1,
          "name": "Breakfast",
          "foods": [
              {
                  "id": 1,
                  "name": "pear",
                  "calories": 33
              },
              {
                  "id": 2,
                  "name": "peach",
                  "calories": 88
              }
          ]
      })
    end
  end
end
