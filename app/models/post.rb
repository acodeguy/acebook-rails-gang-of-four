class Post < ApplicationRecord
  belongs_to :user

  def belongs_to?(person) 
    return (user == person)
  end

  def can_update?(person)
    ten_minutes_ago = DateTime.now - (1/24.0/6)
    belongs_to?(person) && self.created_at > ten_minutes_ago
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
