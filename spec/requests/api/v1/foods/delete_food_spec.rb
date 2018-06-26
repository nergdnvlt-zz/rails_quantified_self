require 'rails_helper'

describe 'delete request for a food' do
  describe 'deletes the food' do
    it 'and gives a 204 response' do
      pear = Food.create(name: 'pear', calories: 33)

      delete "/api/v1/foods/#{pear.id}"

      expect(response.status).to eq(204)
    end
  end

  describe 'cant find the food to delete' do
    it 'and gives a 404 response' do
      pear = Food.create(name: 'pear', calories: 33)

      delete "/api/v1/foods/88"

      expect(response.status).to eq(404)
    end
  end
end
