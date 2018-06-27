class Meal < ApplicationRecord
  validates_presence_of :name

  has_many :meal_foods
  has_many :foods, through: :meal_foods

  def as_json
    {
      id: id,
      name: name,
      foods: foods.map do |food|
        {
          id: food.id,
          name: food.name,
          calories: food.calories
        }
      end
    }
  end
end
