class MealFood < ApplicationRecord
  belongs_to :meal
  belongs_to :food

  def as_json
    {
      "message": "Successfully added FOODNAME to MEALNAME"
    }
  end
end
