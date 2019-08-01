require 'rails_helper'

RSpec.describe 'http request' do
  describe 'GET /' do
    it 'returns a status message' do
      get('/')
      json = JSON.parse(response.body)
      expect(json['status']).to eq('Its working')
      expect(response.status).to eq(200)
    end
  end
end