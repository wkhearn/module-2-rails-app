class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  validates :restaurant_id, presence: true
  validates :wait, presence: true
  validates :rating, presence: true

  def self.most_recent_reviews
    Review.order(created_at: :desc).limit(4)
  end
end
