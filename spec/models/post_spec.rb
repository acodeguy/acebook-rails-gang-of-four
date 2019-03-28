require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }
  it { should belong_to(:user) }

  it('knows whether it belongs to a given user') do
    user = User.create(email: "s@s.com", password: "111111", password_confirmation: "111111")
    post = Post.create(:message => 'a dull post', :user => user)
    expect(post.can_update?(99)).to be(false)
    expect(post.can_update?(user)).to be(true)
  end

  it 'should include created_at time in formatted form' do
    user = User.create(email: "s@s.com", password: "111111", password_confirmation: "111111")
    post = Post.create(message: 'New post', user_id: user.id)
    exp_created_at = post.created_at.strftime(
      '%e %B %Y %l:%M %p'
    )

    expect(post.formatted_created_at).to eq(exp_created_at)
  end

  it 'allows updating only within 10 minutes of posting' do
    user = User.create(email: "s@s.com", password: "111111", password_confirmation: "111111")
    post = Post.create(message: 'New post', user_id: user.id, created_at: DateTime.now - (1/24.0/6))
    expect { post.update({ message: 'This has been updated.' }, user ) }.to raise_error 'Post can no longer be edited'
  end
end
