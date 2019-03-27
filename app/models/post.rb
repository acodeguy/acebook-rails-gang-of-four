class Post < ApplicationRecord
  belongs_to :user

  def belongs_to?(person) 
    return (user == person)
  end
end
