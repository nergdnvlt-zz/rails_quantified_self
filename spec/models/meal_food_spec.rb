require 'rails_helper'

describe MealFood do
  describe 'validations' do
    it {should belong_to :meal }
    it {should belong_to :food }
  end
end
