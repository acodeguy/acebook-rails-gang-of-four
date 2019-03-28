class Post < ApplicationRecord
  belongs_to :user

  def belongs_to?(person) 
    return (user == person)
  end

  def can_update?(person)
    belongs_to?(person) && created_within_last(minutes: 10)
  end

  def created_within_last(minutes:)
    ten_minutes_ago = DateTime.now - (1/24.0/60 * minutes)
    self.created_at > ten_minutes_ago
  end

  def can_delete?(person)
    belongs_to?(person)
  end

  def update(post_params, person)
    raise 'Post can no longer be edited' unless can_update?(person)
    super(post_params)
  end
  
  def formatted_created_at
    self[:created_at].strftime(
      '%e %B %Y %l:%M %p'
    )
  end
end
