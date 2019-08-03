require 'rails_helper'

RSpec.describe 'POST /sessions' do
  describe 'valid scenario' do
    it 'logs in a user' do
      User.create(email: 'abc@gmail.com', password: 'password')
      post '/sessions', params: {
        'email' => 'abc@gmail.com',
        'password' => 'password'
      }
      json = JSON.parse(response.body)
      expect(json['logged_in']).to be_truthy
    end
  end

  describe 'invalid scenario' do
    it 'receives 422 status code' do
      post '/sessions', params: {
        'email' => 'abc@gmail.com',
        'password' => 'password'
      }
      json = JSON.parse(response.body)
      expect(json['status']).to eq(422)
    end
  end
end
