require 'rails_helper'

describe "When requesting to sign in," do
  before do
    post '/auth', params: { email: 't@t.com', password: '123456', password_confirmation: '123456'}
  end
  context "if the user details are valid", type: :request do
    before do
      post '/auth/sign_in', params: { email: 't@t.com', password: '123456' }
    end

    it 'returns status code 200' do
      expect(response.status).to eq(200)
    end  

    it 'returns an access token when successful' do
      expect(response.header).to include('access-token')
    end

    it 'returns a client ID when successful' do
      expect(response.header).to include('client')
    end
  end

  context "if the user details are not valid", type: :request do
    it 'when the password is incorrect' do
      post '/auth/sign_in', params: { email: 't@t.com', password: '1234567' }
      expected_outcome = 'Invalid login credentials. Please try again.'
      expect(JSON.parse(response.body)['errors'].pop).to eq(expected_outcome)
    end

    it 'when the username is incorrect' do
      post '/auth/sign_in', params: { email: 't@t1.com', password: '123456' }
      expected_outcome = 'Invalid login credentials. Please try again.'
      expect(JSON.parse(response.body)['errors'].pop).to eq(expected_outcome)
    end
  end
end
