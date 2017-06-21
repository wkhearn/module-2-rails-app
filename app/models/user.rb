class User < ApplicationRecord
  has_many :reviews
  has_many :restaurants, through: :reviews
  belongs_to :cohort, optional: true

  has_secure_password



  def user_recent_reviews
    self.reviews.where("user_id = ?", current_user).order(created_at: :desc).limit(3)
  end
end
