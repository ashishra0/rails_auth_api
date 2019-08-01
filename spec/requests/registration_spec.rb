require 'rails_helper'

RSpec.describe 'POST /registration' do
  describe 'valid scenario' do
    it 'creates user object' do
      post '/registrations', params: {
        'email' => 'abc@gmail.com',
        'password' => 'password'
      }
      json = JSON.parse(response.body)
      expect(json['status']).to eq('created')
    end
  end

  describe 'invalid scenario' do
    it 'receives 422 status code' do
      User.create(email: 'abc@gmail.com', password: 'password')
      post '/registrations', params: {
        'email' => 'abc@gmail.com',
        'password' => 'password'
      }
      json = JSON.parse(response.body)
      expect(json['status']).to eq(422)
    end
  end
end
