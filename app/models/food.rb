class Food < ApplicationRecord
  validates_presence_of :name, :calories

  def as_json
    {
      id: id,
      name: name,
      calories: calories
    }
  end
end
