class Post < ApplicationRecord
  belongs_to :user

  def belongs_to?(person) 
    return (user == person)
  end

  def can_update?(person)
    belongs_to?(person)
  end

  def can_delete?(person)
    belongs_to?(person)
  end
  
  def formatted_created_at
    self[:created_at].strftime(
      '%e %B %Y %l:%M %p'
    )
  end
end
