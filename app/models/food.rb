class Food < ApplicationRecord
  validates_presence_of :name, :calories

  has_many :meal_foods
  has_many :meals, through: :meal_foods

  def as_json
    {
      id: id,
      name: name,
      calories: calories
    }
  end
end
