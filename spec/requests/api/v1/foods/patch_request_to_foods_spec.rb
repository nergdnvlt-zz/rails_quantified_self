require 'rails_helper'

describe 'a get request to foods#index' do
  describe 'when processed correctly' do
    it 'posts a new food to JSON' do
      food = create(:food)
      patch "/api/v1/foods/#{food.id}", params: { "food": { "name": "peach", "calories": "98"} }

      expect(response).to be_successful

      apricot_response = JSON.parse(response.body)

      expect(apricot_response).to be_a Hash
      expect(apricot_response["name"]).to eq("peach")
      expect(apricot_response["calories"]).to eq(98)
    end
  end
end
