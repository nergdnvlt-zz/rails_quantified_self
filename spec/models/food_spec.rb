require 'rails_helper'

describe Food do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :calories }
    it {should have_many :meal_foods}
    it {should have_many :meals}
  end

  describe 'instance methods' do
    before(:each) do
      @peach = Food.create!(name: 'peach', calories: 88)
    end

    it 'returns a hash of the attributes' do
      peach = @peach.as_json

      expect(peach).to eq({
        id: 1,
        name: 'peach',
        calories: 88
        })
    end
  end
end
