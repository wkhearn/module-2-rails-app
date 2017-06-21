class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :users, through: :reviews


  def average_rating
    self.reviews.average(:rating).to_f
  end

  def user_avg_rating
    self.reviews.where('user_id = ?', current_user.id).average(:rating).to_f
  end
end
