require 'rails_helper'

describe 'a get request to foods#index' do
  describe 'when processed correctly' do
    it 'patches updated food as JSON' do
      food = create(:food)
      patch "/api/v1/foods/#{food.id}", params: { "food": { "name": "peach", "calories": "98"} }

      expect(response).to be_successful

      apricot_response = JSON.parse(response.body)

      expect(apricot_response).to be_a Hash
      expect(apricot_response["name"]).to eq("peach")
      expect(apricot_response["calories"]).to eq(98)
    end
  end

  describe 'when not processed correctly' do
    it 'gives 404 response code when name is missing' do
      food = create(:food)
      patch "/api/v1/foods/#{food.id}", params: { "food": { "calories": "98"} }

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end

    it 'gives 404 response code when calories are missing' do
      food = create(:food)
      patch "/api/v1/foods/#{food.id}", params: { "food": { "name": "peach" } }

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
