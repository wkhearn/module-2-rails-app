class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  def self.most_recent_reviews
    Review.order(created_at: :desc).limit(5)
  end
end
