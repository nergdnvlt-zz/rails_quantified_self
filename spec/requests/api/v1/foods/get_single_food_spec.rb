require 'rails_helper'

describe 'a get request to foods#index' do
  describe 'when processed correctly' do
    it 'gives the food as JSON' do
      pear = Food.create(name: 'pear', calories: 33)

      get "/api/v1/foods/#{pear.id}"

      expect(response).to be_successful

      pear_response = JSON.parse(response.body)

      expect(pear_response).to be_a Hash
      expect(pear_response).to eq({"id"=>1, "name"=>"pear", "calories"=>33})
    end
  end

  describe 'gets a different food' do
    it 'gives the associated food' do
      create_list(:food, 5)
      beer = Food.create(name: 'beer', calories: 35)

      get "/api/v1/foods/#{beer.id}"

      expect(response).to be_successful

      beer_response = JSON.parse(response.body)

      expect(beer_response).to be_a Hash
      expect(beer_response["name"]).to eq("beer")
      expect(beer_response["calories"]).to eq(35)
    end
  end

  describe 'when no food exists' do
    it 'gives a 404 response' do
      pear = Food.create(name: 'pear', calories: 33)

      get "/api/v1/foods/88"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
