require 'rails_helper'

describe "When requesting to sign out of a user account" do
  before do
    register
  end

  it 'signs out successfully' do
    header = response.header
    delete '/auth/sign_out', params: { uid: header['uid'], client: header['client'], 'access-token': header['access-token'] }
    expect(response.status).to eq(200)
  end

  it 'can not reach other routes when signed out' do
    header = response.header
    delete '/auth/sign_out', params: { uid: header['uid'], client: header['client'], 'access-token': header['access-token'] }
    get '/posts', params: { uid: header['uid'], client: header['client'], 'access-token': header['access-token'] }
    expect(response.status).to eq(401)
  end
end

