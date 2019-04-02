require 'rails_helper'

describe "request to create a new user", :type => :request do

  it 'returns status code 200' do
    post '/auth', params: { email: 't@t.com', password: '123456', password_confirmation: '123456'}
    expect(JSON.parse(response.body)['status']).to eq('success')
  end

  it 'rejects a password length less than 6' do
    post '/auth', params: { email: 't@t.com', password: '12345', password_confirmation: '12345'}
    expected_outcome = 'Password is too short (minimum is 6 characters)'
    expect(JSON.parse(response.body)['errors']['full_messages'].pop).to eq(expected_outcome)
  end

  it 'rejects an invalid email format' do
    post '/auth', params: { email: 't@t', password: '123456', password_confirmation: '123456'}
    expected_outcome = 'Email is not an email'
    expect(JSON.parse(response.body)['errors']['full_messages'].pop).to eq(expected_outcome)
  end

  it 'returns an access token when successful' do
    post '/auth', params: { email: 't@t.com', password: '123456', password_confirmation: '123456' }
    expect(response.header).to include('access-token')
  end

  it 'returns an access token when successful' do
    post '/auth', params: { email: 't@t.com', password: '123456', password_confirmation: '123456' }
    expect(response.header).to include('client')
  end
end
