require 'rails_helper'

describe "When requesting all posts," do
    context "if user details are valid", :type => :request do
        let(:user) { User.create(email: "s@s.com", password: "111111", password_confirmation: "111111") }
      before do
        post = Post.create(message: "Hi", user: user)
        post '/auth', params: { email: 't@t.com', password: '123456', password_confirmation: '123456'}
        token = response.header['access-token']
        client = response.header['client']
        email = response.header['uid']
        get '/posts', params: { 'access-token': token, client: client, uid: email}
      end
  
      it 'returns status code 200' do
        expect(response.status).to eq(200)
      end
  
      it 'returns a list of posts when successful' do
         expect(response.body).to include('Hi')
      end
  
    end
  
  end