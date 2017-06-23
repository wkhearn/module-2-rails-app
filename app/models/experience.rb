class Experience < ApplicationRecord
  has_many :experience_signups
  has_many :users, through: :experience_signups
  belongs_to :restaurant
  validates :restaurant_id, presence: true
  validates :date, presence: true

  def exp_dropdown
    "#{self.restaurant.name} - #{self.date.strftime("%B %d, %Y")}"
  end

  def self.upcoming
    Experience.where('date > ?', Time.now).order('date').limit(4)
  end
end
