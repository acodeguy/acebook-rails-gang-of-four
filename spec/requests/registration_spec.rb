require 'rails_helper'

describe "When requesting to create a new user," do
  context "if user details are valid", :type => :request do
    before do
      post '/auth', params: { email: 't@t.com', password: '123456', password_confirmation: '123456'}
    end

    it 'returns status code 200' do
      expect(JSON.parse(response.body)['status']).to eq('success')
    end

    it 'returns an access token when successful' do
      expect(response.header).to include('access-token')
    end

    it 'returns a client ID when successful' do
      expect(response.header).to include('client')
    end
  end

  context "if user details invalid, including", :type => :request do
    it 'when password length less than 6' do
      post '/auth', params: { email: 't@t.com', password: '12345', password_confirmation: '12345'}
      expected_outcome = 'Password is too short (minimum is 6 characters)'

      expect(JSON.parse(response.body)['errors']['full_messages'].pop).to eq(expected_outcome)
    end

    it 'when invalid email format' do
      post '/auth', params: { email: 't@t', password: '123456', password_confirmation: '123456'}
      expected_outcome = 'Email is not an email'
      
      expect(JSON.parse(response.body)['errors']['full_messages'].pop).to eq(expected_outcome)
    end
  end
end
