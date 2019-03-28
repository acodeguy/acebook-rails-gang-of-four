class Post < ApplicationRecord
  belongs_to :user

  def update(post_params, person)
    raise 'Post can no longer be edited' unless can_update?(person)
    
    super(post_params)
  end

  def can_update?(person)
    belongs_to?(person) && created_within_last?(minutes: 10)
  end

  def can_delete?(person)
    belongs_to?(person)
  end

  def belongs_to?(person) 
    return (user == person)
  end

  def created_within_last?(minutes:)
    ten_minutes_ago = DateTime.now - (1 / 24.0 / 60 * minutes)
    self.created_at > ten_minutes_ago
  end
  
  def formatted_created_at
    self[:created_at].strftime(
      '%e %B %Y %l:%M %p'
    )
  end

  private :belongs_to?, :created_within_last? 
end
