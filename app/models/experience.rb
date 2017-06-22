class Experience < ApplicationRecord
  has_many :experience_signups
  belongs_to :restaurant

  def exp_dropdown
    "#{self.restaurant.name} - #{self.date.strftime("%B %d, %Y")}"
  end
end
