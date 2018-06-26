require 'rails_helper'

describe 'a get request to foods#index' do
  describe 'when processed correctly' do
    it 'gives a listing of all foods as JSON' do
      pear = Food.create(name: 'pear', calories: 33)

      get "/api/v1/foods/#{pear.id}"

      expect(response).to be_successful

      pear_response = JSON.parse(response.body)

      expect(pear_response).to be_a Hash
      expect(pear_response).to eq({"id"=>1, "name"=>"pear", "calories"=>33})
    end
  end
end
