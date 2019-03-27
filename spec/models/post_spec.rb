require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it 'should include created_at time in formatted form' do
    post = Post.create(message: 'New post')
    exp_created_at = post.created_at.strftime(
      '%e %B %Y %l:%M %p'
    )

    expect(post.formatted_created_at).to eq(exp_created_at)
  end
end
