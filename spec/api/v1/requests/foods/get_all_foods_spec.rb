require 'rails_helper'

describe 'a get request to foods#index' do
  describe 'when processed correctly' do
    it 'gives a listing of all foods as JSON' do
      pear = Food.create(name: 'pear', calories: 33)
      peach = Food.create(name: 'peach', calories: 88)
      apricot = Food.create(name: 'apricot', calories: 108)
      goat = Food.create(name: 'goat', calories: 38)

      get '/api/v1/foods'

      expect(response).to be_successful

      foods = JSON.parse(response.body)

      expect(foods).to be_a Array
      expect(foods[0]).to eq({"id"=>1, "name"=>"pear", "calories"=>33})
      expect(foods[1]).to eq({"id"=>2, "name"=>"peach", "calories"=>88})
      expect(foods[2]).to eq({"id"=>3, "name"=>"apricot", "calories"=>108})
      expect(foods[3]).to eq({"id"=>4, "name"=>"goat", "calories"=>38})
    end
  end
end
