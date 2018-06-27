require 'rails_helper'

describe Meal do
  describe 'validations' do
    it { should validate_presence_of :name }
    it {should have_many :meal_foods}
    it {should have_many :foods}
  end
end
