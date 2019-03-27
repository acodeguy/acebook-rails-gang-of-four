require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
  it { should belong_to(:user) }

  it('knows whether it belongs to a given user') do
    user = User.create(email: "s@s.com", password: "111111", password_confirmation: "111111")
    post = Post.new(:message => 'a dull post', :user => user)
    expect(post.belongs_to?(99)).to be(false)
    expect(post.belongs_to?(user)).to be(true)
  end
end
