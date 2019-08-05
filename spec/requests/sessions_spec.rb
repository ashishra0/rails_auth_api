require 'rails_helper'

describe 'valid scenario' do
  before do
    User.create(email: 'abc@gmail.com', password: 'password')
    post '/sessions', params: {
      'email' => 'abc@gmail.com',
      'password' => 'password'
    }
  end
  it 'logs in a user' do
    json = JSON.parse(response.body)
    expect(json['logged_in']).to be_truthy
  end

  it 'checks if user is logged in' do
    get '/logged_in'
    json = JSON.parse(response.body)
    expect(json['user']).to eq('abc@gmail.com')
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
